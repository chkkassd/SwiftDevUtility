//
//  ScreenShot.swift
//  
//
//  Created by 赛峰 施 on 2017/1/13.
//  Copyright © 2017年 赛峰 施. All rights reserved.
//

import Foundation
import UIKit

struct SSFScreenShot {
    ///Crop a specific view
    static func screenShot(withView view: UIView) -> UIImage? {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
