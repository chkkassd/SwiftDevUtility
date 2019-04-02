//
//  SSFSortDescriptor.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/3/11.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

public typealias SortDescriptor<T> = (T, T) -> Bool

infix operator |>: LogicalDisjunctionPrecedence

public func |><T>(
    l: @escaping SortDescriptor<T>,
    r: @escaping SortDescriptor<T>) -> SortDescriptor<T> {
    
    return {
        if l($0, $1) {
            return true
        }
        
        if l($1, $0) {
            return false
        }
        
        // $0 and $1 is the same, try the second descriptor
        if r($0, $1) {
            return true
        }
        
        return false
    }
}

public struct SSFSortDescriptor {
    
    public static func makeDescriptor<Key, Value>(key: @escaping (Key) -> Value, _ isAscending: @escaping (Value, Value) -> Bool) -> SortDescriptor<Key> {
        return { isAscending(key($0), key($1)) }
    }
    
    public static func shift<T: Comparable>(
        _ compare: @escaping (T, T) -> Bool) -> (T?, T?) -> Bool {
        return { l, r in
            switch (l, r) {
            case (nil, nil):
                return false
            case (nil, _):
                return false
            case (_, nil):
                return true
            case let (l?, r?):
                return compare(l, r)
            default:
                fatalError()
            }
        }
    }
}


