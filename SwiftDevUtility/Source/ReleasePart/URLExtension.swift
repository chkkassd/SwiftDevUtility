//
//  URLExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

extension URL {
    ///Let a file url translate to a path string
    public var pathString: String? {
        return self.absoluteString.components(separatedBy: "file://").last
    }
}
