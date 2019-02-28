//
//  Utility.swift
//  
//
//  Created by 赛峰 施 on 16/9/21.
//  Copyright © 2016年 赛峰 施. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Extension










extension Optional {
    ///用在closure里，用来保证capture list里被捕捉的对象在用weak修饰后，能够在任务完成之前一直保存在内存里
    func withExtendedLiftTime(_ body: (Wrapped) -> Void) {
        if let value = self {
            body(value)
        }
    }
}

extension UIDevice {
    func isiPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812 || UIScreen.main.bounds.width == 812 {
            return true
        } else {
            return false
        }
    }
}


//MARK:- CustomOperator

infix operator !!

///This fuction acts on force unwrapped an optional value, and if it's nil,crash and print the custom error message .
///- Authors: Peter.Shi
///- date: 2016.11.28
func !!<T>(wrapped: T?, failureText: @autoclosure ()->String) -> T {
    if let x = wrapped { return x }
    fatalError(failureText())
}

infix operator !?

///This fuction acts on force unwrapped an optional value.And when it's in debug,if it's nil,crash and print the custom error message. When it's in release,if it's nil,it won't crash and vend a default value.
///- Authors: Peter.Shi
///- date: 2016.11.28
func !?<T>(wrapped: T?, nilDefault: @autoclosure ()->(value: T, text: String)) -> T {
    assert(wrapped != nil, nilDefault().text)
    
    return wrapped ?? nilDefault().value
}

//MARK: - Public Fundamental Methods

func checkDevice() -> UIUserInterfaceIdiom {
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        return .phone
    case .pad:
        return .pad
    case .carPlay:
        return .carPlay
    case .tv:
        return .tv        
    case .unspecified:
        return .unspecified
    }
}

