//
//  ExtDate.swift
//  Clock
//
//  Created by LogicalWings Mac on 22/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import Foundation
import UIKit

extension Date{
    
    func adding(hours : Int ,minutes : Int,seconds : Int)->String{
        
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd-MM-YY hh:mm:ss a"
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = dateFormatter.string(from: Calendar.current.date(byAdding: .hour, value: hours, to: addingMin(date: self, minutes: minutes, seconds: seconds))!)
        
        return dateStr
    }
    
    func addingMin(date : Date ,minutes : Int , seconds : Int)->Date{
        
        return Calendar.current.date(byAdding: .minute, value: minutes, to: addingSec(date: date, seconds: seconds))!
    }
    
    func addingSec(date : Date ,seconds : Int)->Date{
        
        return Calendar.current.date(byAdding: .second, value: seconds, to: date)!
        
    }
    
    
}
