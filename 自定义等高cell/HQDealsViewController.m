//
//  HQDealsViewController.m
//  自定义等高cell
//
//  Created by Macbook on 2017/4/29.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQDealsViewController.h"
#import "HQDeal.h"
#import "HQTableViewCell.h"



@interface HQDealsViewController ()
@property (nonatomic,strong)NSArray *deals;
@end

@implementation HQDealsViewController

- (NSArray *)deals {
    if (_deals == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *dealArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HQDeal *deal = [HQDeal dealWithDict:dict];
            [dealArray addObject:deal];
        }
        _deals = dealArray;
    }
    return _deals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.deals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HQTableViewCell *cell = [HQTableViewCell cellWithTableView:tableView];
    cell.deal = self.deals[indexPath.row];
    return cell;
    
}



@end
