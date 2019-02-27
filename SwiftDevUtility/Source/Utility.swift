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

extension String {
    
    /**
     A only get computed property that return the md5 string from the origin string.
     - Authors:
     Peter.Shi
     - date: 2016.9.21
     */
//    var md5: String{
//        let cStr = self.cString(using: String.Encoding.utf8)
//        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
//        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
//        let md5String = NSMutableString();
//        for i in 0 ..< 16{
//            md5String.appendFormat("%02x", buffer[i])
//        }
//        free(buffer)
//        return md5String as String
//    }
    
    ///Translate a date string(yy-MM-dd) to Date.
    ///- Authors: Peter.Shi
    ///- date: 2016.10.28
    var translatedDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}

enum WeekDay: Int {
    case MON = 1
    case TUE = 2
    case WED = 3
    case THU = 4
    case FRI = 5
    case SAT = 6
    case SUN = 7
}

extension Date {
    
    ///Translate a date of type Date to a date of type String.
    ///- Authors: Peter.Shi
    ///- date: 2016.9.28
    var standardTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    ///Translate a date to weekday.
    ///- Authors: Peter.Shi
    ///- date: 2016.10.28
    var weekdayString: String {
        let arr = ["周六","周日", "周一", "周二", "周三", "周四", "周五"]
        return arr[self.weekdayIndex!]
    }
    
    ///Translate a date to weekday enum.
    ///- Authors: Peter.Shi
    ///- date: 2016.10.28
    var weekdayEnum: WeekDay {
        let arr = [WeekDay.SAT,WeekDay.SUN, WeekDay.MON, WeekDay.TUE, WeekDay.WED, WeekDay.THU, WeekDay.FRI]
        return arr[self.weekdayIndex!]
    }
    
    ///Translate a date to weekdayIndex，saturday is 0.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.1
    var weekdayIndex: Int? {
        let calendar = Calendar.current
        let calendarComponent = Calendar.Component.weekday
        let theComponents: DateComponents = calendar.dateComponents([calendarComponent], from:self)
        return theComponents.weekday
    }
    
    ///Fetch the first day of a week by a date.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.1
    var firstDayDate: Date? {
        if let index = self.weekdayIndex {
           return Date(timeInterval: -Double(index * 24 * 60 * 60), since: self)
        }
        return nil
    }

    ///Fetch the last day of a week by a date.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.1
    var lastDayDate: Date? {
        if let index = self.weekdayIndex {
            return Date(timeInterval: Double((6-index) * 24 * 60 * 60), since: self)
        }
        return nil
    }
}

extension Array {
    ///Delete the element which matchs the predicate.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0)}
    }
    
    ///Weather all elements match the predicate.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !contains(where: {!predicate($0)})
    }
}

extension Dictionary {
    ///Merge a sequence into a dictionary.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    mutating func merge<S>(_ sequence: S) where S: Sequence, S.Iterator.Element == (key: Key, value: Value) {
            sequence.forEach {self[$0] = $1}
        }
    
    ///Initail a dictionary by a sequence,such as [(key:xx, value:xx)].可以通过tuple数组来初始化字典
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Key, value: Value) {
        self = [:]
        self.merge(sequence)
    }
    
    ///A dictionary's value map to a new value with the transform,after that return a new dictionary.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.3
    func valueMap<T>(_ transform:(Value) -> T) -> [Key:T] {
        return Dictionary<Key,T>(self.map { ($0,transform($1)) })
    }
}

extension Sequence where Iterator.Element: Hashable{
    ///This fuction acts on finding the unique element in the sequence,it will drop the repeated element.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.7
    func unique() -> [Iterator.Element] {
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

extension Double {
    ///This fuction acts on let a double value translate to a string with style of "00 : 00"
    func timeFormatString() -> String
    {
        var timeString = ""
        let time = Int(self)
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

extension URL {
    ///Let a file url translate to a path string
    var pathString: String? {
        return self.absoluteString.components(separatedBy: "file://").last
    }
}

extension UIImage {
    
    ///Scale a big image to a specifial rect small image
    ///compressionQuality: 压缩质量，影响存储大小和图片显示质量
    func scaledImage(_ rect: CGRect, _ compressionQuality: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        self.draw(in: rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else { return nil }
        return UIImage(data: imageData)
    }
}

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

extension UIView {
    //discribe corner radius of a view and reflect in storyboard
    @IBInspectable var viewCornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var viewBorderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var viewBorderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor:self.layer.borderColor!)
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

