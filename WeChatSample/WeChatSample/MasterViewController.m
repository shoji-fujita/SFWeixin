//
//  MasterViewController.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/09.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "MasterViewController.h"
#import "TextViewController.h"
#import "ImageViewController.h"
#import "StampViewController.h"
#import "NewsViewController.h"
#import "MusicViewController.h"
#import "VideoViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"send to weixin";
    _array = [[NSMutableArray alloc] initWithObjects:@"text", @"image", @"stamp", @"news", @"music", @"video", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    UIViewController *detailViewController;
    
    UIBarButtonItem *backButton = [UIBarButtonItem new];
    backButton.title = @"back";
    self.navigationItem.backBarButtonItem = backButton;
    
    switch (indexPath.row) {
        case 0:
            detailViewController = [[TextViewController alloc] initWithNibName:@"TextViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        case 1:
            detailViewController = [[ImageViewController alloc] initWithNibName:@"ImageViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        case 2:
            detailViewController = [[StampViewController alloc] initWithNibName:@"StampViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        case 3:
            detailViewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        case 4:
            detailViewController = [[MusicViewController alloc] initWithNibName:@"MusicViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        case 5:
            detailViewController = [[VideoViewController alloc] initWithNibName:@"VideoViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
            [detailViewController release];
            break;
        default:
            break;
    }
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
