//
//  ExtTextField.swift
//  Clock
//
//  Created by LogicalWings Mac on 16/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    
    func addBorderAndColor(borderWidth : Int , borderColor : UIColor){
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 2
        
    }
}
