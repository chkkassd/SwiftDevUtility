//
//  DictionaryExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

extension Dictionary {
    
    ///Merge a sequence into a dictionary.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    public mutating func merge<S>(_ sequence: S) where S: Sequence, S.Iterator.Element == (key: Key, value: Value) {
        sequence.forEach {self[$0] = $1}
    }
    
    ///Initail a dictionary by a sequence,such as [(key:xx, value:xx)].可以通过tuple数组来初始化字典
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Key, value: Value) {
        self = [:]
        self.merge(sequence)
    }
    
    ///A dictionary's value map to a new value with the transform,after that return a new dictionary.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    public func valueMap<T>(_ transform:(Value) -> T) -> [Key:T] {
        return Dictionary<Key,T>(self.map { ($0,transform($1)) })
    }
}
