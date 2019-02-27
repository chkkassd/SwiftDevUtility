//
//  LocalizableHelper.swift
//
//传统的storyboard国际化方法有诸多缺点
//1.增加新的UI组件后，xib文件无法自动更新
//2.可读性差，使用objectID
//3.代码国际化和xib国际化使用两份.strings文件，无法复用，实在不合理，有诸多重复
//我们使用协议扩展的方法，利用User Defined Runtime Attributes来实现复用Localizable.strings实现国际化
//
//  Created by 赛峰 施 on 2018/12/10.
//  Copyright © 2018年 PETER SHI. All rights reserved.

import Foundation
import UIKit

protocol Localizable {
    var SSFLocalizedString: String {get}
}

extension String: Localizable {
    var SSFLocalizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}

protocol XIBLocalizable {
    var xibLocalKey: String? {set get}
}

extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocalKey: String? {
        get {return nil}
        set(key) {
            text = key?.SSFLocalizedString
        }
    }
}

extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocalKey: String? {
        get {return nil}
        set(key) {
            setTitle(key?.SSFLocalizedString, for: .normal)
        }
    }
}

extension UIBarItem: XIBLocalizable {
    @IBInspectable var xibLocalKey: String? {
        get {return nil}
        set(key) {
            title = key?.SSFLocalizedString
        }
    }
}

extension UINavigationItem: XIBLocalizable {
    @IBInspectable var xibLocalKey: String? {
        get {return nil}
        set(key) {
            title = key?.SSFLocalizedString
        }
    }
}

//手动App内切换语言步骤
//1.app完成基本国际化操作
//2.切换bundle
//3.刷新页面（最简单的就是通过keywindow重置rootviewcontroller）

class LocalizableBundle: Bundle {
    //重载这个方法，因为无论xib或是代码，国际化都会通过这个方法得到对应字符串
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        guard let bundle = Bundle.fetchCurrentLanguageBundle() else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    //根据当前语言创建新的bundle,不同的语言用的是不同的lproj
    class func fetchCurrentLanguageBundle() -> Bundle?{
        guard let path = Bundle.main.path(forResource: (UserDefaults.standard.value(forKey: "AppleLanguages") as! [String]).first, ofType: "lproj") else {return nil}
        guard let languageBundle = Bundle(path: path) else {return nil}
        return languageBundle
    }
    
    //切换main bundle为对应语言的bundle
    //将Bundle.main的isa指针修改为指向子类LocalizableBundle
    class func loadLanguage() {
        Bundle.loadLanguageDispatchOnce()
    }
    
    //swift3.0之后取消了dispatch_once的api，官方说明，可以是使用懒加载全局变量和类属性来实现同样的线程安全和只初始化一次
    private static var loadLanguageDispatchOnce: () -> Void = {
        object_setClass(Bundle.main, LocalizableBundle.self)
    }
}
