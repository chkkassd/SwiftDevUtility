//
//  DateExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

public enum WeekDay: Int {
    case MON = 1
    case TUE = 2
    case WED = 3
    case THU = 4
    case FRI = 5
    case SAT = 6
    case SUN = 7
}

extension Date {
    
    ///Convert date to string(yyyy-MM-dd HH:mm:ss)
    ///- Authors: Peter.Shi
    ///- date: 2016.9.28
    public var standardTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
    ///Convert a date to chinese weekday string.
    ///- Authors: Peter.Shi
    ///- date: 2016.10.28
    public var weekdayString: String {
        let arr = ["周六","周日", "周一", "周二", "周三", "周四", "周五"]
        return arr[self.weekdayIndex!]
    }
    
    ///Convert a date to weekday enum.
    ///- Authors: Peter.Shi
    ///- date: 2016.10.28
    public var weekdayEnum: WeekDay {
        let arr = [WeekDay.SAT,WeekDay.SUN, WeekDay.MON, WeekDay.TUE, WeekDay.WED, WeekDay.THU, WeekDay.FRI]
        return arr[self.weekdayIndex!]
    }
    
    ///Convert a date to weekdayIndex(saturday is 0, sunday is 1, Monday is 2,...).
    ///- Authors: Peter.Shi
    ///- date: 2016.11.1
    public var weekdayIndex: Int? {
        let calendar = Calendar.current
        let calendarComponent = Calendar.Component.weekday
        let theComponents: DateComponents = calendar.dateComponents([calendarComponent], from:self)
        return theComponents.weekday
    }
    
    ///Fetch the first day of a week by a date.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.1
    public var firstDayDate: Date? {
        if let index = self.weekdayIndex {
            return Date(timeInterval: -Double(index * 24 * 60 * 60), since: self)
        }
        return nil
    }
    
    ///Fetch the last day of a week by a date.
    ///- Authors: Peter.Shi
    ///- date: 2016.11.1
    public var lastDayDate: Date? {
        if let index = self.weekdayIndex {
            return Date(timeInterval: Double((6-index) * 24 * 60 * 60), since: self)
        }
        return nil
    }
}
