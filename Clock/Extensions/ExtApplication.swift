//
//  ExtApplication.swift
//  Clock
//
//  Created by LogicalWings Mac on 15/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor
        } set {
            (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = newValue
            
        }
    }
}
