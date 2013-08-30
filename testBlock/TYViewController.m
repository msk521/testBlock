//
//  TYViewController.m
//  mskproject
//
//  Created by msk on 13-7-15.
//  Copyright (c) 2013年 SHTY. All rights reserved.
//

#import "TYViewController.h"
#import "TYMyOperation.h"
#define EXCEPTION @"数组越界"
#define EXCEPTION_NAME @"MyException"


#define ISREMOVE 0

#ifdef ISREMOVE
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) do { } while (0)
#endif

@interface TYViewController ()

@end

@implementation TYViewController
@synthesize fileChange;

- (void)viewDidLoad
{
    [super viewDidLoad];
		@autoreleasepool {
				NSException *ect = [NSException exceptionWithName:EXCEPTION_NAME reason:EXCEPTION userInfo:nil];
				@try {
						NSArray *arr = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
						NSLog(@"arr:%@",[arr objectAtIndex:5]);
				}
				@catch (NSException *ectx) {
						ectx = ect;
						NSLog(@"ect:%@",ect.reason);
				}
				@finally {
						NSLog(@"------");
				}
		}
		
		TYObject *ob1 = [[TYObject alloc] init];
		TYObject *ob2 = [[TYObject alloc] init];
		TYObject *ob3 = [[TYObject alloc] init];
		TYObject *ob4 = [[TYObject alloc] init];
		
		
		NSArray *arr = [[NSArray alloc] initWithObjects:ob1,ob2,ob3,ob4, nil];
//		dispatch_queue_t qt = dispatch_queue_create("com.msk", NULL);
//		dispatch_apply(arr.count, qt, ^(size_t i) {
//				TYObject *ty = [arr objectAtIndex:i];
//				[ty print:@"ssssss"];
//		});
		[arr makeObjectsPerformSelector:@selector(print:)withObject:@"sssss"];
		
		[self textQueue];
		//[self disPatch_test];
}

-(void)textQueue{
		@autoreleasepool {
				NSInvocationOperation *invo = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printInfo:) object:@"msk"];
				NSInvocationOperation *invo1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printInfo:) object:@"msk1"];
				NSInvocationOperation *invo2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printInfo:) object:@"msk2"];
				NSInvocationOperation *invo3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printInfo:) object:@"msk3"];
				NSInvocationOperation *invo4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printInfo:) object:@"msk4"];

				NSBlockOperation *bloc = [NSBlockOperation blockOperationWithBlock:^{
						[self printInfo:@"msk block"];
				}];
			
//
//				TYMyOperation *op = [[TYMyOperation alloc] init];
				NSOperationQueue *queue = [[NSOperationQueue alloc] init];
				[queue addOperation:invo];
				[queue addOperation:invo1];
				[queue addOperation:invo2];
				[queue addOperation:invo3];
				[queue addOperation:invo4];
			  [queue addOperation:bloc];
				[invo setQueuePriority:NSOperationQueuePriorityLow];
				[invo4 setQueuePriority:NSOperationQueuePriorityVeryHigh];
//				[queue addOperation:op];
//				[queue addOperation:bloc];
		}
}

-(void)disPatch_test{
		dispatch_async(dispatch_get_main_queue(), ^{
				[self printInfo:@"msk queue"];
		});
		
		dispatch_queue_t que = dispatch_queue_create("com.msk.queue", NULL);
		dispatch_sync(que, ^{
				[self printInfo:@" msk sync"];
				
		});
}

-(void)printInfo:(NSString *)str{
		NSLog(@"str:%@",str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
