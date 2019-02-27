//
//  ResultDescription.swift
//  
//
//  Created by 赛峰 施 on 2017/3/21.
//  Copyright © 2017年 赛峰 施. All rights reserved.
//

import Foundation

///This enumuration describes the result of all situation.
enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Result {
    ///Functor
    func map<U>(_ transform: (T) -> U) -> Result<U> {
        switch self {
        case .success(let v):
            return .success(transform(v))
        case .failure(let error):
            return .failure(error)
        }
    }

    ///Applicative
    func apply<U>(_ transform: Result<(T) -> U>) -> Result<U> {
        switch transform {
        case .success(let function):
            return self.map(function)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    ///Monad
    func flatMap<U>(_ transform: (T) -> Result<U>) -> Result<U> {
        switch self {
        case .success(let v):
            return transform(v)
        case .failure(let e):
            return .failure(e)
        }
    }
}

precedencegroup ChainingPrecedence {
    associativity: left
    higherThan: TernaryPrecedence
}

///Functor
infix operator <^>: ChainingPrecedence

func <^><T, U>(lhs: (T) -> U, rhs: Result<T>) -> Result<U> {
    return rhs.map(lhs)
}

///Applicative
infix operator <*>: ChainingPrecedence

func <*><T, U>(lhs: Result<(T) -> U>, rhs: Result<T>) -> Result<U> {
    return rhs.apply(lhs)
}

///Monad
infix operator >>-: ChainingPrecedence

func >>-<T, U>(lhs: Result<T>, rhs: (T) -> Result<U>) -> Result<U> {
    return lhs.flatMap(rhs)
}

///&
infix operator <&>: ChainingPrecedence

func <&><T, U>(lhs: Result<T>, rhs: Result<U>) -> Result<U> {
    switch (lhs, rhs) {
    case (.success(_), .success(let v2)):
        return .success(v2)
    case (.failure(let error), _):
        return .failure(error)
    case (_, .failure(let error)):
        return .failure(error)
    }
}
