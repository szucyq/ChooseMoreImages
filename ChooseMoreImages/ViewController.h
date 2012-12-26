//
//  ViewController.h
//  ChooseMoreImages
//
//  Created by andone on 12-12-26.
//  Copyright (c) 2012年 andone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHImagePickerMutilSelector.h"

@interface ViewController : UIViewController<MHImagePickerMutilSelectorDelegate>

@property (nonatomic,retain)NSMutableArray *importItems;
@end
