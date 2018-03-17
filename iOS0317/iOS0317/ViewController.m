//
//  ViewController.m
//  iOS0317
//
//  Created by 侯凌霄 on 2018/3/17.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong,nonatomic)NSArray *listGroupName;
@property (strong, nonatomic) NSArray *listData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSBundle *bundle= [NSBundle mainBundle];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    
    self.dictData = [[NSDictionary  alloc] initWithContentsOfFile:plistPath];
    
    NSArray *tempList=[self.dictData allKeys];
    self.listGroupName=[tempList sortedArrayUsingSelector:@selector(compare:)];
    
//    self.listData = [self.dictData allKeys];
    
    
    self.title = @"联系人";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.listData count];
    
    NSString *groupName=self.listGroupName[section];
    NSArray *listTeams=self.dictData[groupName];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSUInteger section=[indexPath section];
    NSUInteger row=[indexPath row];
    NSString *groupName=self.listGroupName[section];
    NSArray *listTeams=self.dictData[groupName];
    cell.textLabel.text=listTeams[row];
    
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//
//    NSInteger row = [indexPath row];
//    cell.textLabel.text = self.listData[row];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.listGroupName count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *groupName=self.listGroupName[section];
    return groupName;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *listTitles=[[NSMutableArray alloc]init];
    for (NSString *item in self.listGroupName) {
        NSString *title=[item substringToIndex:1];
        [listTitles addObject:title];
    }
    return listTitles;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger selectedIndex = [indexPath row];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithStyle:UITableViewStylePlain];
    NSString *selectName = self.listData[selectedIndex];
    detailViewController.listData = self.dictData[selectName];
    detailViewController.title = selectName;
    
    [self.navigationController pushViewController:detailViewController animated:TRUE];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
