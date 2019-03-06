//
//  UIImageExtension.swift
//  SwiftDevUtility
//
//  Created by 赛峰 施 on 2019/2/28.
//  Copyright © 2019 PETER SHI. All rights reserved.
//

import Foundation

extension UIImage {
    
    ///Scale a big image to a small image with specifial rect
    ///compressionQuality: 压缩质量，影响存储大小和图片显示质量
    public func scaledImage(_ rect: CGRect, _ compressionQuality: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else { return nil }
        return UIImage(data: imageData)
    }
}
