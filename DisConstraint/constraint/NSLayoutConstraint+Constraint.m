//
//  NSLayoutConstraint+Constraint.m
//  DisConstraint
//
//  Created by ya ran on 2019/6/4.
//  Copyright © 2019 Ryan. All rights reserved.
//

#import "NSLayoutConstraint+Constraint.h"
#import <objc/runtime.h>

// 基准屏幕宽度
#define kRefereWidth 375.0
//以屏幕宽度为固定比例关系，来计算对应的值。假设：基准屏幕宽度375，floatV=10；当前屏幕宽度为750时，那么返回的值为20
#define AdaptW(floatValue) (floatValue*[[UIScreen mainScreen] bounds].size.width/kRefereWidth)

static char *AdapterScreenKey = "AdapterScreenKey";

@implementation NSLayoutConstraint (Constraint)

- (BOOL)adapterScreen{
    NSNumber *number = objc_getAssociatedObject(self, AdapterScreenKey);
    return number.boolValue;
}

- (void)setAdapterScreen:(BOOL)adapterScreen {
    
    NSNumber *number = @(adapterScreen);
    objc_setAssociatedObject(self, AdapterScreenKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (adapterScreen){
        self.constant = AdaptW(self.constant);
    }
}

@end
