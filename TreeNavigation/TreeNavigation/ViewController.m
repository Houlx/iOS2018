


#import "ViewController.h"
#import "ContactsViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    
    self.dictData = [[NSDictionary  alloc] initWithContentsOfFile:plistPath];
    self.listData = [self.dictData allKeys];
    self.title = @"联系人";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = self.listData[row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger selectedIndex = [indexPath row];
    
    ContactsViewController *contactsViewController = [[ContactsViewController alloc] initWithStyle:UITableViewStylePlain];
    NSString *selectName = self.listData[selectedIndex];
    contactsViewController.listData = self.dictData[selectName];
    contactsViewController.title = selectName;
    
    [self.navigationController pushViewController:contactsViewController animated:TRUE];
}


@end
