//
//  StringExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    /**
     A read-only computed property that return the md5 string from the origin string.
     - Authors:
     Peter.Shi
     - date: 2016.9.21
     */
     public var md5String: String {
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    ///Convert a ISO8601 string(yyyy-MM-dd'T'HH:mm:ssZ) to Date.
    ///- Authors: Peter.Shi
    ///- date: 2016.10.28
    public var convertedDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    
    ///This fuction acts on let a double value seconds translate to a string with style of "00 : 00"
    public static func timeFormatString(_ seconds: Double) -> String {
        var timeString = ""
        let time = Int(seconds)
        if (time < 60) {
            if (time < 10) {
                timeString = "00:0\(time)"
            } else {
                timeString = "00:\(time)"
            }
        } else if (time >= 60) {
            let minute = Int(time / 60)
            let second = Int(time % 60)
            var minuteString = ""
            var secondString = ""
            if (minute < 10) {
                minuteString = "0\(minute)"
            } else {
                minuteString = "\(minute)"
            }
            if (second < 10) {
                secondString = "0\(second)"
            } else {
                secondString = "\(second)"
            }
            timeString = "\(minuteString):\(secondString)"
        }
        return timeString;
    }
}
