//
//  TYViewController.h
//  mskproject
//
//  Created by msk on 13-7-15.
//  Copyright (c) 2013年 SHTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYObject.h"
typedef void (^FieldChange)(NSString *values);
@interface TYViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *blockField;
@property (nonatomic ,assign) FieldChange fileChange;
@end
