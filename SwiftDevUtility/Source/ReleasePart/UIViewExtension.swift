//
//  UIViewExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //discribe corner radius of a view and reflect in storyboard
    @IBInspectable public var viewCornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable public var viewBorderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable public var viewBorderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor:self.layer.borderColor!)
        }
    }
}
