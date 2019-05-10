//
//  StopWatchViewController.swift
//  Clock
//
//  Created by LogicalWings Mac on 14/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    var startFlag = false
    
    var totalTime = 0.0
    
    var timer : Timer?
    
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblSec: UILabel!
    @IBOutlet weak var lblMilli: UILabel!
    
    @IBOutlet weak var btnManageStopWatch: UIButton!
    @IBOutlet weak var lblManageStopWatch: UILabel!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var lblReset: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "stopwatchVcTitle".localized()
        
        btnReset.isHidden = true
        lblReset.isHidden = true
        
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        
        totalTime = 0
        btnReset.isHidden = true
        lblReset.isHidden = true
        startFlag = false
        btnManageStopWatch.setImage(UIImage(named: "play1x"), for: .normal)
        lblManageStopWatch.text = "Start"
        
        lblMin.text = "00"
        lblSec.text = "00"
        lblMilli.text = "00"
        
        endTimer()
    }
    
    @IBAction func btnManageStopWatchAction(_ sender: UIButton) {
        
        if startFlag{
            
            startFlag = false
            btnManageStopWatch.setImage(UIImage(named: "play1x"), for: .normal)
            lblManageStopWatch.text = "Start"
            endTimer()
            
        }else{
            
            btnReset.isHidden = false
            lblReset.isHidden = false
            startFlag = true
            btnManageStopWatch.setImage(UIImage(named: "pause1x"), for: .normal)
            lblManageStopWatch.text = "Pause"
            startTimer()
        }
    }
    
    func startTimer(){
        
//        DispatchQueue.global(qos: .background).async {
//
//            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.getTime), userInfo: nil, repeats: true)
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.getTime), userInfo: nil, repeats: true)
        
    }
    
    func endTimer(){
        
        timer?.invalidate()
    }
    
    @objc func getTime(){
        
        lblMin.text = "\(getMin(totalTime))"
        lblSec.text = "\(getSec(totalTime))"
        lblMilli.text = "\(getMilli(totalTime))"

        totalTime = totalTime + 0.01
        
        print(totalTime)
    }
    
    
    func getMin(_ totalMilliSeconds : Double)->String{
        
        let minutes: Int = Int(((totalMilliSeconds * 100) / 100)/60)
        
        if minutes < 15{
            lblMin.textColor = UIColor.green
        }else if minutes < 30{
            lblMin.textColor = UIColor.yellow
        }else if minutes < 45{
            lblMin.textColor = UIColor.orange
        }else{
            lblMin.textColor = UIColor.red
        }
        
        return String(format: "%2d", Int(minutes))
    }
    
    func getSec(_ totalMilliSeconds : Double)->String{
        let seconds: Int = Int(((totalMilliSeconds * 100) / 100).truncatingRemainder(dividingBy: 60))
        
        if seconds < 15{
            lblSec.textColor = UIColor.green
        }else if seconds < 30{
            lblSec.textColor = UIColor.yellow
        }else if seconds < 45{
            lblSec.textColor = UIColor.orange
        }else{
            lblSec.textColor = UIColor.red
        }
        
        return String(format: "%2d", Int(seconds))
    }
    
    func getMilli(_ totalMilliSeconds : Double)->String{
        
        let millseconds = (totalMilliSeconds * 100).truncatingRemainder(dividingBy: 100)
        
        if millseconds < 25{
            lblMilli.textColor = UIColor.green
        }else if millseconds < 50{
            lblMilli.textColor = UIColor.yellow
        }else if millseconds < 75{
            lblMilli.textColor = UIColor.orange
        }else{
            lblMilli.textColor = UIColor.red
        }
        
        return String(format: "%2d", Int(millseconds))
    }
 
}
