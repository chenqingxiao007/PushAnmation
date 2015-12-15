//
//  ViewController.m
//  控制器翻转
//
//  Created by 陈擎霄 on 15/12/15.
//  Copyright © 2015年 chenqingxiao007. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#import "CXPopAnimation.h"
#import "CXPushAnimation.h"

@interface ViewController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) CXPushAnimation *pushAnimation;

@property (strong, nonatomic) CXPopAnimation *popAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pushAnimation = [[CXPushAnimation alloc] init];
    self.popAnimation = [[CXPopAnimation alloc] init];
    self.navigationController.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
    
    MyViewController *vc = [[MyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }
    else if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }
    
    return nil;
}



@end

























