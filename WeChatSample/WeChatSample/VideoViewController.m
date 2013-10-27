//
//  VideoViewController.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "VideoViewController.h"
#import "Weixin.h"
#import "ItemVideo.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

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
    [self keyboardHide];
    if (![_itemVideo.url hasPrefix:@"http"]) _itemVideo.url = @"http"; // 微信でのエラー対策
    
    [Weixin sendVideoTitle:_itemVideo.title description:_itemVideo.description thumbImage:_itemVideo.thumbImage url:_itemVideo.url toWXScene:_itemVideo.scene];
    NSLog(@"%@, %@, %@, %@, %d", _itemVideo.title, _itemVideo.description, _itemVideo.thumbImage, _itemVideo.url, _itemVideo.scene);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"video";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(toWeixin)];
    _itemVideo = [[ItemVideo alloc] init];
    _itemVideo.title = @"";
    _itemVideo.description = @"";
    _itemVideo.thumbImage = nil;
    _itemVideo.url = @"";
    _itemVideo.scene = WXSceneSession;
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_viewTapped:)];
    [self.view addGestureRecognizer:tapGesture];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)_viewTapped:(UITapGestureRecognizer *)sender
{
    [self keyboardHide];
}

- (void)keyboardHide
{
    for (UIView* view in self.view.subviews)
    {
        if ([NSStringFromClass([view class]) isEqualToString:@"TextFieldCell"])
        {
            TextFieldCell *textFieldCell = (TextFieldCell*)view;
            [textFieldCell.textField resignFirstResponder];
        }
        if ([NSStringFromClass([view class]) isEqualToString:@"TextViewCell"])
        {
            TextViewCell *textViewCell = (TextViewCell*)view;
            [textViewCell.textView resignFirstResponder];
        }
    }
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static const id identifiers[5] = {@"TextFieldCell", @"TextViewCell", @"ImageViewCell", @"TextField", @"SegmentViewCell"};
    NSString* identifier = identifiers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        switch (indexPath.row) {
            case 0:
                cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                TextFieldCell *textFieldCell = (TextFieldCell*)cell;
                textFieldCell.delegate = self;
                textFieldCell.label.text = @"title";
                break;
            case 1:
                cell = [[TextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                TextViewCell *textViewCell = (TextViewCell*)cell;
                textViewCell.delegate = self;
                textViewCell.label.text = @"description";
                break;
            case 2:
                cell = [[ImageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                ImageViewCell *imageViewCell = (ImageViewCell*)cell;
                imageViewCell.delegate = self;
                imageViewCell.type = kThumbSquare;
                imageViewCell.label.text = @"thumb";
                break;
            case 3:
                cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                TextFieldCell *textFieldCell2 = (TextFieldCell*)cell;
                textFieldCell2.delegate = self;
                textFieldCell2.label.text = @"url";
                textFieldCell2.textField.placeholder = @"http://www.tudou.com/";
                textFieldCell2.textField.keyboardType = UIKeyboardTypeURL;
                break;
            case 4:
                cell = [[SegmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                SegmentCell *segmentCell = (SegmentCell*)cell;
                segmentCell.delegate = self;
                break;
        }
    }
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
            return 44*3;
        case 2:
            return 44*2;
        default:
            return 44;
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

#pragma mark - TextFieldCellDelegate -

- (void)textFieldDidEndEditing:(TextFieldCell *)textFieldCell
{
    NSString* string = textFieldCell.textField.text;
    
    if ([textFieldCell.label.text isEqualToString:@"title"]) {
        _itemVideo.title = string;
    }
    else if ([textFieldCell.label.text isEqualToString:@"url"])
    {
        _itemVideo.url = string;
    }
}

#pragma mark - TextViewCellDelegate -

- (void)textViewDidEndEditing:(TextViewCell *)textViewCell
{
    _itemVideo.description = textViewCell.textView.text;
}

#pragma mark - ImageViewCellDelegate -

- (void)imageSet:(ImageViewCell *)imageViewCell
{
    [self keyboardHide];
    
    _itemVideo.thumbImage = imageViewCell.photo.image;
}

#pragma mark - SegmentCellDelegate

- (void)segmentValueChange:(SegmentCell *)segmentCell
{
    _itemVideo.scene = segmentCell.segment.selectedSegmentIndex;
}

@end
