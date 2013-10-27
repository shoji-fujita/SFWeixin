//
//  StampViewController.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "StampViewController.h"
#import "Weixin.h"
#import "ItemStamp.h"

@interface StampViewController ()

@end

@implementation StampViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)toWeixin
{
    [Weixin sendStampData:_itemStamp.stampData thumbImage:_itemStamp.thumbImage];
    NSLog(@"%@, %@", _itemStamp.stampData, _itemStamp.thumbImage);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"stamp";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(toWeixin)];
    _itemStamp = [[ItemStamp alloc] init];
    _itemStamp.stampData = nil;
    _itemStamp.thumbImage = nil;
    
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static const id identifiers[2] = {@"ImageViewCell", @"ImageViewCell"};
    NSString* identifier = identifiers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        switch (indexPath.row) {
            case 0:
                cell = [[ImageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                ImageViewCell *imageViewCell = (ImageViewCell*)cell;
                imageViewCell.delegate = self;
                imageViewCell.type = kImageStamp;
                imageViewCell.label.text = @"stamp";
                break;
            case 1:
                cell = [[ImageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                ImageViewCell *imageViewCell2 = (ImageViewCell*)cell;
                imageViewCell2.delegate = self;
                imageViewCell2.type = kThumbRect;
                imageViewCell2.label.text = @"thumb";
                break;
        }
    }
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 44*3;
        default:
            return 44*2;
    }
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark - ImageViewCellDelegate -

- (void)imageSet:(ImageViewCell *)imageViewCell
{
    switch (imageViewCell.type) {
        case kImageStamp:
            _itemStamp.stampData = imageViewCell.data;
            break;
        default:
            _itemStamp.thumbImage = imageViewCell.photo.image;
            break;
    }
}

@end





