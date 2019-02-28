//
//  ReadWriteFileManager.swift
//  
//
//  Created by 赛峰 施 on 2018/12/4.
//  Copyright © 2018年 PETER SHI. All rights reserved.
//

import Foundation

struct ReadWriteFileManager {
    //read plist
    func readPlistFile(from fileURL: URL) -> [String: Any]? {
        guard fileURL.pathExtension == "plist", let data = try? Data(contentsOf: fileURL) else {return nil}
        guard let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {return nil}
        return result
    }
}
