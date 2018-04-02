//
//  ViewController.m
//  ContactDemoCoreData
//
//  Created by 侯凌霄 on 2018/3/31.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ViewController.h"
#import "PersonManagedObject+CoreDataClass.h"
#import "DetailViewController.h"
#import "AddContactViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screen.size.width;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //    UIButton *addContact = [UIButton buttonWithType:UIButtonTypeSystem];
    //    [addContact setTitle:@"Add" forState:UIControlStateNormal];
    
    //CGRect rectOfStatusBar= [[UIApplication sharedApplication] statusBarFrame];
    //    CGFloat buttonWidth = 60;
    //    CGFloat buttonHeight = 40;
    //    CGFloat buttonTopView = 20;
    //
    //    addContact.frame = CGRectMake(screenWidth - buttonWidth, buttonTopView, buttonWidth, buttonHeight);
    
    //    [self.view addSubview:addContact];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addContact:)];
    
    NSError *error = nil;
    
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingString:@"Person.sqlite"]];
    
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    if (store == nil) {
        [NSException raise:@"DB Error" format:@"%@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.persistentStoreCoordinator = psc;
    
    self.listName = [[NSMutableArray alloc] init];
    
    [self initContactList];
    
    self.title = @"联系人";
    
    //    [self showAll];
    
    //    [self deleteAll];
    
}

- (void)addContact:(id)sender {
    if (sender == self.navigationItem.rightBarButtonItem) {
        AddContactViewController *addContactViewController = [[AddContactViewController alloc] init];
        addContactViewController.upperViewController = self;
        addContactViewController.title = @"添加";
        
        [self.navigationController pushViewController:addContactViewController animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.name != nil || self.phone != nil || self.addr != nil) {
        NSLog(@"%@%@%@",self.name,self.phone,self.addr);
        [self insertObjectWithName:self.name Phone:self.phone Addr:self.addr];
        self.name = nil;
        self.phone = nil;
        self.addr = nil;
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    //    }
    
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    for (NSManagedObject *obj in objs) {
        if(![self.listName containsObject:[obj valueForKey:@"name"]]){
            [self.listName addObject:[obj valueForKey:@"name"]];
        }
    }
    
    return [self.listName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    for (NSManagedObject *obj in objs) {
        if(![self.listName containsObject:[obj valueForKey:@"name"]]){
            [self.listName addObject:[obj valueForKey:@"name"]];
        }
    }
    
    NSUInteger
    row = (NSUInteger)
    [indexPath row];
    cell.textLabel.text = self.listName[row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger selectedIndex = [indexPath row];
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.name = self.listName[(NSUInteger) selectedIndex];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", self.listName[(NSUInteger) selectedIndex]];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    detailViewController.contactDetail = @[[objs[0] valueForKey:@"phone"], [objs[0] valueForKey:@"addr"]];
    detailViewController.title = self.listName[(NSUInteger) selectedIndex];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)initContactList {
    [self deleteAll];
    [self insertObjectWithName:@"Alice" Phone:@"12345" Addr:@"FU St."];
    [self insertObjectWithName:@"Amy" Phone:@"54321" Addr:@"CK St."];
    [self insertObjectWithName:@"Bob" Phone:@"13579" Addr:@"Dang St."];
}

- (void)insertObjectWithName:(NSString *)name Phone:(NSString *)phone Addr:(NSString *)addr {
    NSManagedObject *s1 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    [s1 setValue:name forKey:@"name"];
    [s1 setValue:phone forKey:@"phone"];
    [s1 setValue:addr forKey:@"addr"];
    
    NSError *error = nil;
    
    if ([context save:&error]) {
        NSLog(@"Succeed!");
    } else {
        [NSException raise:@"插入错误" format:@"%@", [error localizedDescription]];
    }
}

- (void)deleteAll {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    for (NSManagedObject *obj in objs) {
        [context deleteObject:obj];
    }
}

- (void)showAll {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    for (NSManagedObject *obj in objs) {
        NSLog(@"name = %@, phone = %@, addr = %@", [obj valueForKey:@"name"], [obj valueForKey:@"phone"], [obj valueForKey:@"addr"]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
