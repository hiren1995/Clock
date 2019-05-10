//
//  ExtImage.swift
//  Clock
//
//  Created by LogicalWings Mac on 14/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
