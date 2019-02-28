//
//  SSFTheme.swift
//  
//
//  Created by 赛峰 施 on 2018/11/28.
//  Copyright © 2018年 PETER SHI. All rights reserved.
//

import Foundation
import UIKit

//We will add all changeable object to this array.And we use NSMapTable to avoiding memory leak
var themeColorPool = [NSMapTable<AnyObject, AnyObject>]()
//The current theme color, default is "PrimaryColor"
var currentThemeColor: UIColor = UIColor(named: "PrimaryColor")!

extension NSObject {
    //Add color changeable object to color pool
    func addToThemeColorPool(propertyName: String) {
        if self.isMember(of: UIAppearance.self) {
            return
        }
        let mapTable = NSMapTable<AnyObject, AnyObject>(keyOptions: NSPointerFunctions.Options.copyIn, valueOptions: NSPointerFunctions.Options.weakMemory)//NSMapTable<AnyObject, AnyObject>.weakToWeakObjects()
        mapTable.setObject(self, forKey: propertyName as AnyObject)
        //判断是否已经在主题池中
        for table in themeColorPool {
            if table.description == mapTable.description {
//                print("******repeat add\(table.description)*****\n")
                return
            }
        }
        //加入主题池
        themeColorPool.append(mapTable)
//        print("***count is \(themeColorPool.count),*********add in is \(mapTable.description)********\n")
        //设置为当前主题颜色
        self.setValue(currentThemeColor, forKey: propertyName)
    }
    
    //Set the app with current theme color
    func setAppThemeColor() {
        guard themeColorPool.count > 0 else {return}
        for mapTable in themeColorPool {
            var keyString: String = ""
            while let key = mapTable.keyEnumerator().nextObject() {
                keyString = key as! String
                break
            }
            let object = mapTable.object(forKey: keyString as AnyObject)
            object!.setValue(currentThemeColor, forKeyPath: keyString)
        }
    }
}
