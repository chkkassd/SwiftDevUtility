//
//  FIFOQueue.swift
//  
//
//  Created by 赛峰 施 on 2016/11/21.
//  Copyright © 2016年 赛峰 施. All rights reserved.
//

import Foundation
/**
 ## Overview
 This struct queue is customized,and it represnets a queue which first in and first out,it adopt collection protocol,so it owns map,reduce,filter methods and so on.It adopts ExpressibleByArrayLiteral protocol,so it owns expressibleByArrayLiteral initional methods.It adopts RangeReplaceableCollection,so it owns append,remove methods and so on.
 
 ## Initializers
 You can creat the class or struct by the flowing ways.
 
     var q = ["1", "2", "foo", "3"]
 ## Usage
        q.append("hh")
        q.append(contentsOf: ["kk","jj"])
        q.remove(at: 2)
 
        q.index(after: 0)
        // 你可以用for...in 循环访问队列
        for s in q { print(s) }
        let a = Array(q)
 
        // 调用 SequenceType 的扩展方法
        q.map { $0.uppercased() }
        q.flatMap { Int ( $0) }
        q.filter {
            $0.characters.count > 1
        }
        // 调用 CollectionType 的扩展方法
        q.isEmpty
        // false
        q.count
        // 4
        q.first // "1"
 ---
  */
struct FIFOQueue<Element>: Queue {
    fileprivate var left: [Element]
    fileprivate var right: [Element]
    
    init() {
        left = []
        right = []
    }
    
    /// 将元素添加到队列最后
    /// - 复杂度: O(1)
    mutating func enqueue(newElement: Element) {
        right.append(newElement)
    }
    
    /// 从队列前端移除一个元素
    /// 当队列为空时，返回 nil
    /// - 复杂度: 平摊 O(1)
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

protocol Queue {
    associatedtype Element
    mutating func enqueue(newElement: Element)
    mutating func dequeue() -> Element?
}

extension FIFOQueue: Collection {
    public var startIndex: Int { return 0 }
    public var endIndex: Int { return left.count + right.count }
    
    public func index(after i: Int) -> Int {
        precondition(i<endIndex)
        return i + 1
    }
    
    public subscript(position: Int) -> Element {
        precondition((0..<endIndex).contains(position), "Index out of bounds")
        if position < left.endIndex {
            return left[left.count - position - 1]
        } else {
            return right[position - left.count]
        }
    }
}

extension FIFOQueue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.init()
        self.left = elements.reversed()
        self.right = []
    }
}

extension FIFOQueue: RangeReplaceableCollection {
    mutating func replaceSubrange<C: Collection>(_ subrange: Range<Int>,
                                  with newElements: C) where C.Iterator.Element == Element {
        right = left.reversed() + right
        left.removeAll()
        right.replaceSubrange(subrange, with: newElements)
    }
}
