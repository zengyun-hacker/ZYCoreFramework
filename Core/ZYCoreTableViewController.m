//
//  ZYCoreTableViewController.m
//  Pods
//
//  Created by dreamer on 15/9/26.
//
//

#import "ZYCoreTableViewController.h"
#import "ZYCoreCellInfo.h"
#import "ZYCoreTableViewCell.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface ZYCoreTableViewController ()

@end

@implementation ZYCoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ZYCoreCellInfo *)cellInfoWithIndexPath:(NSIndexPath *)indexPath {
    if (self.tableViewData.count > 0) {
        return self.tableViewData[indexPath.section][indexPath.row];
    }
    return [ZYCoreCellInfo new];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableViewData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tableViewData && self.tableViewData.count > 0) {
        NSArray *rows = (NSArray *)self.tableViewData[section];
        return rows.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYCoreCellInfo *cellInfo = [self cellInfoWithIndexPath:indexPath];
    if (cellInfo.cellHeight > 0) {
        //如果有写死的高度直接用
        return cellInfo.cellHeight;
    }
    //否则用换成的高度
    ZYCoreCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    return [tableView fd_heightForCellWithIdentifier:info.reuseIdentifier configuration:^(ZYCoreTableViewCell * cell) {
        cell.data = info.cellData;
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYCoreCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    ZYCoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:info.reuseIdentifier forIndexPath:indexPath];
    if (info.cellDidReuse) {
        info.cellDidReuse(tableView,[self tableView:tableView cellForRowAtIndexPath:indexPath],indexPath,info);
    }
    cell.data = info.cellData;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYCoreCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    if (info.cellDidSelected) {
        info.cellDidSelected(tableView,[self tableView:tableView cellForRowAtIndexPath:indexPath],indexPath,info);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYCoreCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    if (info.cellWillDisplay) {
        info.cellWillDisplay(tableView,[self tableView:tableView cellForRowAtIndexPath:indexPath],indexPath,info);
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
