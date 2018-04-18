# SafeObject

## 前言

    此文是基于这些年工作中项目里面常见崩溃的一些总结，整理出来方便查阅，希望对大家都有所帮助。


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
    




![Mou icon](https://github.com/MrLujh/Fastlane--Packaging/blob/master/111.gif)


