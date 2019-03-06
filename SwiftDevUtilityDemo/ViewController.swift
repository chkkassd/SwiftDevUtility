//
//  ViewController.swift
//  SwiftDevUtilityDemo
//
//  Created by 赛峰 施 on 2019/2/27.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import UIKit
import SwiftDevUtility

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testStringExtension()
        testArrayExtension()
        testDictionaryExtension()
        testSequenceExtension()
        testDateExtension()
        testURLExtension()
        testUIImageExtension()
        testAppInfoHelper()
        testDirectoryPath()
        let image = SSFScreenShot.screenShot(withView: self.view)
    }

    func testStringExtension() {
        print("-------------now test string extension---------\n")
        //test md5
        let a = "Hello world"
        print("=======\(a.md5String)\n")
        //test translate to date
        let time = "2019-3-12T12:34:23+0000"
        let dateTime = time.convertedDate
        print("=====\(dateTime)\n")
        let seconds = 188.8
        print("=====\(String.timeFormatString(seconds))\n")
    }

    func testDateExtension() {
        print("-------------now test date extension---------\n")
        let date = Date()
        print("=====\(date.standardTimeString)")
        print("=====\(date.weekdayIndex)")
        print("=====\(date.weekdayEnum)")
        print("=====\(date.weekdayString)")
        print("=====\(date.firstDayDate)")
        print("=====\(date.lastDayDate)")
        
    }
    
    func testArrayExtension() {
        print("-------------now test array extension---------\n")
        let a = [1,2,3,4,5,6]
        let b = a.reject{$0 % 2 == 0}
        print("=====\(b)")
        let c = a.allMatch{$0 > 0}
        print("=====\(c)")
    }
    
    func testDictionaryExtension() {
        print("-------------now test dictionary extension---------\n")
        var a = ["name": "jack", "age": "10"]
        let b = ["name": "Tom", "age": "10", "address": "shanghai"]
        a.merge(b)
        print("=====\(a)\n")
        
        let c = [("name", "Peter"), ("age", "20")]
        let d = Dictionary(c)
        print("====\(d)\n")
        
        let e = ["height": 80, "width": 100]
        let f = e.valueMap { $0 / 2 }
        print("=====\(f)\n")
    }
    
    func testSequenceExtension() {
        print("-------------now test sequence extension---------\n")
        let a = [1,2,3,4,4,8,8]
        let b = a.unique()
        print("=====\(b)\n")
    }
    
    func testURLExtension() {
        print("-------------now test URL extension---------\n")
        let fileURL = DirectoryPath.urlInDocument(with: "test")
        print("=====\(fileURL)\n")
        let filePath = fileURL.pathString
        print("=====\(filePath)\n")
    }
    
    func testUIImageExtension() {
        print("-------------now test UIImage extension---------\n")
        let aImage = UIImage(named: "water")
        print("======\(aImage?.size)\n")
        let bImage = aImage?.scaledImage(CGRect(x: 0, y: 0, width: 20, height: 20), 1.0)
        print("======\(bImage?.size)\n")
    }
    
    func testAppInfoHelper() {
        print("-------------now test AppInfoHelper extension---------\n")
        print("=========\(AppInfoHelper.appName)\n")
        print("=========\(AppInfoHelper.appVersion)\n")
        print("=========\(AppInfoHelper.appBuildVersion)\n")
    }
    
    func testDirectoryPath() {
        print("-------------now test DirectoryPath extension---------\n")
        
        print("=========\(DirectoryPath.pathOfDocuments())\n")
        print("=========\(DirectoryPath.pathOfCache())\n")
        print("=========\(DirectoryPath.pathOfTemporary())\n")
        
        print("=========\(DirectoryPath.urlInDocument(with: "haha"))\n")
        print("=========\(DirectoryPath.urlInCache(with: "hehe"))\n")
        print("=========\(DirectoryPath.urlInTemporary(with: "hihi"))\n")
        
        print("=========\(DirectoryPath.directoryPathInDocument(withDirectoryName: "test1"))\n")
        print("=========\(DirectoryPath.directoryURLInDocument(withDirectoryName: "test2"))\n")
    }
}

