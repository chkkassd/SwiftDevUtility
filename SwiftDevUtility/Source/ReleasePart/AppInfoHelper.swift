//
//  AppInfoHelper.swift
//  Fetch app infomation such as app version,app build,app name and so on.
//  Created by 赛峰 施 on 2018/12/13.
//  Copyright © 2018年 PETER SHI. All rights reserved.
//

import Foundation

public struct AppInfoHelper {
    
    ///Fetch the app version
    public static var appVersion: String? = {
        guard let infoDic = Bundle.main.infoDictionary else {return nil}
        return infoDic["CFBundleShortVersionString"] as? String
    }()
    
    ///Fetch the app build version
    public static var appBuildVersion: String? = {
        guard let infoDic = Bundle.main.infoDictionary else {return nil}
        return infoDic["CFBundleVersion"] as? String
    }()
    
    ///Fetch the app name
    public static var appName: String? = {
        guard let infoDic = Bundle.main.infoDictionary else {return nil}
        return infoDic["CFBundleDisplayName"] as? String
    }()
}
