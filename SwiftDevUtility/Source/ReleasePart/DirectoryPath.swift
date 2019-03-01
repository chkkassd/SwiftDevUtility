//
//  DirectoryPath.swift
//  
//
//  Created by 赛峰 施 on 2017/1/12.
//  Copyright © 2017年 赛峰 施. All rights reserved.
//

import Foundation

public struct DirectoryPath {
    ///Document directory path
    public static func pathOfDocuments() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
    }
    
    ///Temporary directory path
    public static func pathOfTemporary() -> String {
        return NSTemporaryDirectory()
    }
    
    ///Cache directory path
    public static func pathOfCache() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
    }
    
    ///Create URL in document compent
    public static func urlInDocument(with component: String) -> URL {
        let filePath = self.pathOfDocuments().appending("/\(component)")
        if !FileManager.default.fileExists(atPath: filePath) {
            FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        }
        return URL(fileURLWithPath: filePath)
    }
    
    ///Create URL in temporary compent
    public static func urlInTemporary(with component: String) -> URL {
        let filePath = self.pathOfTemporary().appending("/\(component)")
        if !FileManager.default.fileExists(atPath: filePath) {
            FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        }
        return URL(fileURLWithPath: filePath)
    }

    ///Create URL in cache compent
    public static func urlInCache(with component: String) -> URL {
        let filePath = self.pathOfCache().appending("/\(component)")
        if !FileManager.default.fileExists(atPath: filePath) {
            FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        }
        return URL(fileURLWithPath: filePath)
    }

    ///Creat directory path at document directory
    public static func directoryPathInDocument(withDirectoryName name: String) -> String {
        let directoryPath = self.pathOfDocuments().appending("/\(name)")
        if !FileManager.default.fileExists(atPath: directoryPath) {
            try? FileManager.default.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)
        }
        return directoryPath
    }
    
    ///Creat directory URL at document directory
    public static func directoryURLInDocument(withDirectoryName name: String) -> URL {
        let directoryPath = self.pathOfDocuments().appending("/\(name)")
        let directoryURL = URL(fileURLWithPath: self.pathOfDocuments()).appendingPathComponent(name)
        if !FileManager.default.fileExists(atPath: directoryPath) {
            try? FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        }
        return directoryURL
    }
}
