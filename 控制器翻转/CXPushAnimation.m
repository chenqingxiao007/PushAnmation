//
//  CXPushAnimation.m
//  控制器翻转
//
//  Created by 陈擎霄 on 15/12/15.
//  Copyright © 2015年 chenqingxiao007. All rights reserved.
//

#import "CXPushAnimation.h"


@implementation CXPushAnimation

/* 动画持续的时间 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 1.获取要跳转的目标控制器
    UIViewController *desController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 2.获取来源控制器
    UIViewController *sourceController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 3. 将view添加到containerView中
    [[transitionContext containerView] addSubview:desController.view];
    desController.view.alpha = 0.0;
    desController.view.backgroundColor =[UIColor blackColor];
    // 4.动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         sourceController.view.transform = CGAffineTransformMakeTranslation(-sourceController.view.bounds.size.width, 0.0);
                         sourceController.view.transform = CGAffineTransformMakeScale(-1, 1);
                         desController.view.alpha = 1.0;
                         desController.view.backgroundColor =[UIColor purpleColor];
                     }
                     completion:^(BOOL finished) {
                         sourceController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

- (void)test{
 
    
}
@end












