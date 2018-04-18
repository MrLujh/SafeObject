# SafeObject

## 支持pod导入

* pod 'RouteManager'

* 执行pod search RouteManager提示搜索不到，可以执行以下命令更新本地search_index.json文件
  
```objc 
rm ~/Library/Caches/CocoaPods/search_index.json
```
* 如果pod search还是搜索不到，执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了

## App常见崩溃，容器越界，字典空值处理

* 数组下标越界

示例代码：

```objc       
- (void)testArrayOutOfBounds
{
    NSArray *testArray = @[@1,@2,@3];
    
    NSNumber *num = testArray[3];
}
```

* 字典构造造与修改

示例代码：

```objc       
- (void)testDicSetNilValueCrash
{
    // 构造不可变字典时 key和value都不能为空
    NSString *nilValue = nil;
    NSString *nilKey = nil;
    NSDictionary *dic1 = @{@"key" : nilValue};
    NSDictionary *dic2 = @{nilKey : @"value"};
}

```

## 方法交换

* Runtime解决数据越界及字典key或value为nil的情况，主要通过Runtime的方法交换实现，可以扩展一下NSObject分类:
    

```objc       
+ (void)exchangeInstanceMethodWithSelfClass:(Class)selfClass
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector {
    
    Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    BOOL didAddMethod = class_addMethod(selfClass,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(selfClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

```

```objc
/**
 在range范围内， 移除掉anObject
 
 @param anObject 移除的anObject
 @param range 范围
 */
- (void)safeMutable_removeObject:(id)anObject inRange:(NSRange)range {
    if (range.location > self.count) {
        return;
    }
    
    if (range.length > self.count) {
        return;
    }
    
    if ((range.location + range.length) > self.count) {
        return;
    }
    
    if (!anObject){
        return;
    }
    
    
    return [self safeMutable_removeObject:anObject inRange:range];
    
}
```

![Mou icon](https://github.com/MrLujh/Fastlane--Packaging/blob/master/111.gif)


