//
//  SequenceExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: Hashable{
    
    ///This fuction acts on finding the unique element in the sequence,it will drop the repeated element.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.7
    public func unique() -> [Iterator.Element] {
        var tem: Set<Iterator.Element> = []
        return filter{ if tem.contains($0) {
            return false
        } else {
            tem.insert($0)
            return true
            }
        }
    }
}
