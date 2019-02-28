//
//  AlertUtility.swift
//  
//
//  Created by 赛峰 施 on 2018/10/30.
//  Copyright © 2018年 PETER SHI. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    //present alert with textfield
    static func presentAlertWithTextField(title: String, message: String, handler: ((String) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { textfield in }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in }
        let okAction = UIAlertAction(title: "确定", style: .default) { _ in
            guard let okHandler = handler else { return }
            let titleText = alert.textFields?.first?.text ?? ""
            okHandler(titleText)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        return alert
    }
}
