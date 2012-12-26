//
//  ViewController.m
//  ChooseMoreImages
//
//  Created by andone on 12-12-26.
//  Copyright (c) 2012年 andone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MHImagePickerMutilSelector* imagePickerMutilSelector=[MHImagePickerMutilSelector standardSelector];//自动释放
    imagePickerMutilSelector.delegate=self;//设置代理
    
    UIImagePickerController* picker=[[UIImagePickerController alloc] init];
    picker.delegate=imagePickerMutilSelector;//将UIImagePicker的代理指向到imagePickerMutilSelector
    [picker setAllowsEditing:NO];
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    picker.modalTransitionStyle= UIModalTransitionStyleCoverVertical;
    picker.navigationController.delegate=imagePickerMutilSelector;//将UIImagePicker的导航代理指向到imagePickerMutilSelector
    
    imagePickerMutilSelector.imagePicker=picker;//使imagePickerMutilSelector得知其控制的UIImagePicker实例，为释放时需要。
    picker.view.tag=1;
    
    //[self presentModalViewController:picker animated:YES];
    [self presentViewController:picker animated:YES completion:nil];
//    [self.view addSubview:picker.view];
    [picker release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)imagePickerMutilSelectorDidGetImages:(NSArray *)imageArray
{
    self.importItems=[[NSMutableArray alloc] initWithArray:imageArray copyItems:YES];
    NSLog(@"choose images:%@",self.importItems);
}
- (void)closeImagePicker{
    [[self.view viewWithTag:1]removeFromSuperview];
}
@end
