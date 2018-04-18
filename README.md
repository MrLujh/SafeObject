# RNExample---react-native 示例

## 示例项目运行步骤
前天需要安装一下node.js，如果没有先安装一下
1.进入RN文件  终端运行：npm install

2.进入项目目录  终端运行：pod install

3.进入RN文件   终端运行：npm start,然后运行项目就可以了

## 前言

    对于 React Native，iOS 开发者社区也是褒贬不一。有一部分的开发者认为React Native无论在性能，开发成本还是效率都要比苹果原生那套要好，成为开发的首选；也有一部分的开发着认为React Native 不过是 Facebook 的又一个玩具，以它现在的稚嫩还难以对原生的 Swift/Objective-C 造成足够威胁。对一门新兴的技术是否值得在开发采用，取决于该技术的本身是否具备足够的优点和是否符合目前的开发需求。


## 起源

* Native App 优点是功能强大、性能优越。但终究是受制于苹果，而且多版本维护十分痛苦。

* 为了不受苹果掌控，Facebook 曾花费大量的人力物力进行移动 HTML5 技术研发。虽然有些成果，但始终离 Native App 有差距，而且这个差距可能永远赶不上。

* 在转型 Native App 开发后，Facebook 内部其实还在研发一种新的移动技术，并开始使用这种技术开发内部 App。这个技术便是 React Native。

* 2015年3月，Facebook 正式公开发布 React Native，并将该技术开源。虽然当时开发平台仅支持 Mac OS，部署也仅支持 iOS 平台。

* 2015年9月15日，Facebook 发布了 React Native for Android，把 Web 和原生平台的 JavaScript 开发技术扩展到了 Google 的流行移动平台 Android 上。至此，React Native 实现了跨平台的特性。

## React、React.js、React Native三者的联系

* React 是基础框架,提供了一套基础设计实现理念。
    
* React.js 是在 React 理念的指导下产生的专门用来开发网页的 web 前端框架。与 React 同时出现和发展，React 的相关概念都在 React.js 文档中。

* React Native 是用来开发移动端 app 的。只不过是用了 React.js 那套模式，而底层是对 Native Code 的封装及调用。


## React Native的优点

* 性能媲美原生应用

    * 由于 React Native 提供的组件是对原生 API 的暴露。虽然我们是用 js 写的代码，但实际上调用的是原生 API，原生的 UI 组件。体验上足以媲美原生应用。

* 开发效率高

    * 相比于原生开发，js 学习成本低、语法灵活。允许让 Web 开发者更多地基于现有经验开发 App。

* 组件化开发

    * React 强调将应用划分成多个互不相关的组件，每个组件作为一个独立的视图。这种类似搭积木的开发方式使得代码结构清晰、通用性高、可移植性高。上一个项目的某些组件，可以很方便地拿来在下一个项目中使用。对于那些优秀的第三方组件，也能很方便地集成到我们项目中来。

* 节约开发成本

    * 百分之90多界面可以通过 React Native 开发，一份代码同时可以适配 Android 和 iOS。并通过一些手段自动匹配不同屏幕大小的手机，再也不需要自己去计算视图的大小和位置。
    
* 实时远程调试

    * React Native 的调试比 Cordova 不知道好到哪里去了。开启了实时重载之后，代码一改，app 就自动更新成最新，对于 UI 的搭建简直是省了不少的编译时间。同时可以打开 XCode 实时的看到所有的 log 信息。

* 代码热部署

    * 我们知道 AppStore 审核流程超级久。而由于 React Native 是用的 js 来写的代码，实时编译的过程能让我们实现应用像网页一样做到热更新，随时发布。真正能够做到上架审核一次，永久 0 审核更新。

* 有效降低移动应用安装包体积

    * 对于普通复杂度的移动应用，使用 React Native 实现的安装包会比原生代码实现的安装包大。而当移动应用功能越复杂，React Native 安装包体积相比原生代码安装包就越小。
比如当原生代码实现的安装包大于 15MB 时，使用 React Native 改写代码后，安装包就小于原生代码实现的安装包。
    
## React Native的优缺点深层分析请看下面链接：

      http://www.sohu.com/a/206616854_100072094
      
## 项目中快速集成react-native步骤

1.开发环境配置参照链接：https://reactnative.cn/docs/0.51/getting-started.html

2.创建一个空项目，在项目目录下创建一个文件夹放相关文件，比如这个文件夹名字为RN,终端进入RN文件，touch index.ios.js;touch rnview.js;touch package.json

index.ios.js文件的内容如下：

```objc       
import { AppRegistry } from 'react-native';

import rnview from './rnview';

AppRegistry.registerComponent('RN', () => rnview);
```
AppRegistry.registerComponent('RN', () => rnview)---“RN”注册入口；“rnview”组件

rnview.js组件文件的内容如下：
    
```objc       
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
    NativeModules
} from 'react-native';
var RNBridgeEventManager = NativeModules.RNBridgeEventManager;
export default class RNtoNative extends Component {
    render() {
        return (
            <View style={styles.container}>
              <Text style={styles.welcome} onPress={()=>this.passValueToNativeOne()}>点击往原生传字符串</Text>
              <Text style={styles.welcome} onPress={()=>this.passValueToNativeTwo()}>点击往原生传字符串+字典</Text>
              <Text style={styles.welcome} onPress={()=>this.passValueToNativeThree()}>点击往原生传字符串+日期</Text>
              <Text style={styles.welcome} onPress={()=>this.callBackOne()}>点击调原生+回调</Text>
              <Text style={styles.welcome} onPress={()=>this.callBackTwo()}>Promises1116666</Text>
              <Text style={styles.welcome} onPress={()=>this.useNativeValue()}>使用原生定义的常量</Text>
            </View>
        );
    }
    // 传原生一个字符串
    passValueToNativeOne = ()=>{
        RNBridgeEventManager.addEventOne('周少停');
    }
    // 传原生一个字符串 + 字典
    passValueToNativeTwo = ()=>{
        RNBridgeEventManager.addEventTwo('周少停',{job:'programmer'});
    }
    // 传原生一个字符串 + 日期
    passValueToNativeThree = ()=>{
        RNBridgeEventManager.addEventThree('周少停',19910730);
    }
    // 传原生一个字符串 + 回调
    callBackOne = ()=>{
        RNBridgeEventManager.testCallbackEventOne(('我是RN给原生的'),(error, events) => {
            if (error) {
                console.error(error);
            } else {
                alert(events)
            }
        })
    }
    //Promise回调
    async callBackTwo(){
        try{
            var events=await RNBridgeEventManager.testCallbackEventTwo();
            alert(events)
        }catch(e){
            console.error(e);
        }
    }
    //使用原生定义的常量
    useNativeValue = ()=>{
        alert(RNBridgeEventManager.ValueOne)
    }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

```
package.json文件的内容如下：
```objc       
{
    "name": "RNExample",
    "version": "0.0.1",
    "private": true,
    "scripts": {
        "start": "node node_modules/react-native/local-cli/cli.js start"
    },
    "dependencies": {
        "react": "15.3.1",
        "react-native": "^0.33.0"
    },
    "devDependencies": {
        "babel-plugin-transform-decorators-legacy": "^1.3.4"
    }
}
```
     "name": "RNExample"-----换成自己的项目名称
     
 3.通过终端进入RN文件下，运行：npm install  下载react-native库文件
 
 4.创建podfile文件,通过pod 把react-native和项目关联
 
```objc 
 # platform :ios, '9.0'

target 'RNExample' do
 
  pod 'React', :path => './RN/node_modules/react-native', :subspecs => [
    'Core',
    'ART',
    'RCTActionSheet',
    'RCTAdSupport',
    'RCTGeolocation',
    'RCTImage',
    'RCTNetwork',
    'RCTPushNotification',
    'RCTSettings',
    'RCTText',
    'RCTVibration',
    'RCTWebSocket',
    'RCTLinkingIOS',
    ]
  
end
``` 
   './RN/node_modules/react-native'---node_modules存放的路径
   
5.项目RN入口代码如下：

```objc
#if TARGET_IPHONE_SIMULATOR
        [[RCTBundleURLProvider sharedSettings] setJsLocation:@"localhost"];
#else
        [[RCTBundleURLProvider sharedSettings] setDefaults];
#endif
        NSURL *jsCodeLocation;
        jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
        
        RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                            moduleName:@"RN"
                                                     initialProperties:nil
                                                         launchOptions:nil];
        
        [self addSubview:rootView];
        rootView.frame = self.bounds;
```

moduleName:@"RN"要和index.ios.js中的注册想对应

6.plist文件中网络请求设置

```objc
<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>localhost</key>
            <dict>
                <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
                <true/>
            </dict>
        </dict>
    </dict>

```
7.终端进入RN文件下启动服务器：npm start

8.通过xcode运行项目，按照上面的步骤来，不出意外项目就可以运行起来了。

## react-native 和原生界面交互

组件中的创建相应的类和原生的项目中的类进行映射，名字一一对应，以及RN上控件的点击事件都是在组件中命名好的，原生界面只需要重写一次点击事件就可以了

![Mou icon](https://github.com/MrLujh/RNExample/blob/master/Resource/resource_01.png)

![Mou icon](https://github.com/MrLujh/RNExample/blob/master/Resource/resource_02.png)

![Mou icon](https://github.com/MrLujh/RNExample/blob/master/Resource/resource_03.png)

![Mou icon](https://github.com/MrLujh/RNExample/blob/master/Resource/resource_04.png)



![Mou icon](https://github.com/MrLujh/Fastlane--Packaging/blob/master/111.gif)


