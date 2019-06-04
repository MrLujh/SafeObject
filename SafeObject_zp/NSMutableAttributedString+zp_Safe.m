//
//  NSMutableAttributedString+zp_Safe.m
//  SafeObjectCrash
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 lujh. All rights reserved.
//

#import "NSMutableAttributedString+zp_Safe.h"
#import <objc/runtime.h>

@implementation NSMutableAttributedString (zp_Safe)
+ (void)load{
    
    Method oldMethod = class_getInstanceMethod(self, @selector(initWithString:attributes:));
    Method safeMethod = class_getInstanceMethod(self, @selector(safe_initWithString:attributes:));
    
    method_exchangeImplementations(oldMethod, safeMethod);
    
    
}
- (instancetype)safe_initWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs{
    if (str.length <= 0) {
#ifdef DEBUG
        NSAssert(str, @"Method (initWithString:attributes:) invlie:str");
#else
        str = @"";
#endif
        
    }
    return [self safe_initWithString:str attributes:attrs];
}
@end
