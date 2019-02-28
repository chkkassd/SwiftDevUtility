//
//  ArrayExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

extension Array {
    ///Delete the element which matchs the predicate.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    public func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0)}
    }
    
    ///Weather all elements match the predicate.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    public func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !contains(where: {!predicate($0)})
    }
}
