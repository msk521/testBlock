//
//  TYMyOperation.m
//  newproject
//
//  Created by msk on 13-7-17.
//  Copyright (c) 2013年 SHTY. All rights reserved.
//

#import "TYMyOperation.h"

@implementation TYMyOperation
-(void)start{
		[NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
}
-(void)main{
		NSLog(@"msk main");
}
-(BOOL)isConcurrent{
		return YES;
}
@end
