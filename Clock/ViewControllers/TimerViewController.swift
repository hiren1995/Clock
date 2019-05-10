//
//  TimerViewController.swift
//  Clock
//
//  Created by LogicalWings Mac on 14/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

class TimerViewController: BaseViewController {

    @IBOutlet weak var txtHours: UITextField!
    @IBOutlet weak var txtMinutes: UITextField!
    @IBOutlet weak var txtSeconds: UITextField!
    @IBOutlet weak var resetStackView: UIStackView!
    @IBOutlet weak var TimerHandleStackView: UIStackView!
    @IBOutlet weak var controlsStackView: UIStackView!
    @IBOutlet weak var TimerView: UIView!
    @IBOutlet weak var setTimerView: UIView!
    @IBOutlet weak var lblTimer: UILabel!
    
    var TimerEndDateStr = String()
    var countdownTimer: Timer!
    var totalTime = Int()
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    var timerFlag : Bool = false
    
    private var AppForegroundNotification: NSObjectProtocol?
    private var AppBackgroundNotification: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "timerVcTitle".localized()
        
        txtHours.addBorderAndColor(borderWidth: 2, borderColor: UIColor.white)
        
        txtMinutes.addBorderAndColor(borderWidth: 2, borderColor: UIColor.white)
        
        txtSeconds.addBorderAndColor(borderWidth: 2, borderColor: UIColor.white)
        
        
        controlsStackView.arrangedSubviews[0].isHidden = true
        TimerView.isHidden = true
        
        checkCurrentDatewithTimer()
        
        AppForegroundNotification = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) {
            [unowned self] notification in
            
            self.ResumeApp()
        }
        
        AppBackgroundNotification = NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main) {
            [unowned self] notification in
            
            self.PauseApp()
        }
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        // make sure to remove the observer when this view controller is dismissed/deallocated
        
        if let appforegroundnotification = AppForegroundNotification {
            NotificationCenter.default.removeObserver(appforegroundnotification)
        }
        if let appbackgroundnotification = AppBackgroundNotification{
            
            NotificationCenter.default.removeObserver(appbackgroundnotification)
        }
    }
    
    @IBAction func btnControlTimer(_ sender: UIButton) {
    
        if((txtSeconds.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty)!){
            
        }
        
        if ((txtHours.text! as NSString).intValue == 0 && (txtMinutes.text! as NSString).intValue == 0 && (txtSeconds.text! as NSString).intValue == 0) || (txtHours.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty)!{
            self.showAlert(message: "invalidTime".localized())
        }else if((txtHours.text! as NSString).intValue == 0 && (txtMinutes.text! as NSString).intValue == 0 && (txtSeconds.text! as NSString).intValue == 0) || (txtMinutes.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty)!{
            self.showAlert(message: "invalidTime".localized())
        }else if((txtHours.text! as NSString).intValue == 0 && (txtMinutes.text! as NSString).intValue == 0 && (txtSeconds.text! as NSString).intValue == 0) || (txtSeconds.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty)!{
            self.showAlert(message: "invalidTime".localized())
        }else{
            initiateTimer()
        }
    }
    
    func checkCurrentDatewithTimer(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateStr = dateFormatter.string(from: Date())
        
        if(UserDefaults.standard.value(forKey: "EndTime") != nil){
            
            let TodayDateTime = dateFormatter.date(from: dateStr)
            
            let EndDateTime = dateFormatter.date(from: UserDefaults.standard.value(forKey: "EndTime") as! String)
            
            compareDates(TodayDateTime: TodayDateTime!, EndDateTime: EndDateTime!)
        }
    }
    
    func initiateTimer(){
        
        let date = Date()
        print(date)
        
        TimerEndDateStr = date.adding(hours: (txtHours.text as! NSString).integerValue, minutes: (txtMinutes.text as! NSString).integerValue, seconds: (txtSeconds.text as! NSString).integerValue)
        print(TimerEndDateStr)
        
        UserDefaults.standard.set(TimerEndDateStr, forKey: "EndTime")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateStr = dateFormatter.string(from: Date())
        
        let formattedDate = dateFormatter.date(from: dateStr)
        let timerDate = dateFormatter.date(from: TimerEndDateStr)
        
        compareDates(TodayDateTime: formattedDate!, EndDateTime: timerDate!)
    }
    
    func compareDates(TodayDateTime : Date , EndDateTime : Date){
        
        if(TodayDateTime < EndDateTime){
            print("initate Timer")
            
            controlsStackView.arrangedSubviews[0].isHidden = false
            setTimerView.isHidden = true
            TimerView.isHidden = false
            
            let diff = EndDateTime.timeIntervalSince1970 - TodayDateTime.timeIntervalSince1970
            
            totalTime = Int(diff)
            
            print(totalTime)
            
            startTimer()
        }
        else{
            print("date error !!")
        }
    }
    
    func startTimer() {
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        //addCircularPrgressView()
    }
    
    @objc func updateTime() {
        
        lblTimer.text = "\(timeFormatted(totalTime))"
        
        if !timerFlag{
            
            addCircularPrgressView()
            timerFlag = true
        }
        
        if totalTime != 0 {
            totalTime -= 1
            
        } else {
            
            endTimer()
        }
    }
    
    func endTimer() {
        
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        
        
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours,minutes, seconds)
        
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        controlsStackView.arrangedSubviews[0].isHidden = true
        setTimerView.isHidden = false
        TimerView.isHidden = true
        txtHours.text = "00"
        txtMinutes.text = "00"
        txtSeconds.text = "00"
        
        trackLayer.removeFromSuperlayer()
        shapeLayer.removeFromSuperlayer()
        
        endTimer()
        totalTime = 0
        timerFlag = false
        UserDefaults.standard.removeObject(forKey: "EndTime")
    }
    
    
    func addCircularPrgressView(){
        
        let x = self.view.center.x
        let y = self.view.center.y - 50
        let center = CGPoint(x: x, y: y)
        
        let path = UIBezierPath(arcCenter: center, radius: TimerView.frame.width/2, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        
        //adding track layer to timer
        
        trackLayer.path = path.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth  = 10
        trackLayer.lineCap = CAShapeLayerLineCap.round
        self.view.layer.addSublayer(trackLayer)
        
        //animating shapeLayer
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth  = 10
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        self.view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = Double(totalTime) + Double(((totalTime/60) * 16))
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "circularPath")
    }
    
    @objc func ResumeApp()
    {
        print("Application running again from background")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateStr = dateFormatter.string(from: Date())
        
        if(UserDefaults.standard.value(forKey: "EndTime") != nil){
            
            let TodayDateTime = dateFormatter.date(from: dateStr)
            
            let EndDateTime = dateFormatter.date(from: UserDefaults.standard.value(forKey: "EndTime") as! String)
            
            compareDates(TodayDateTime: TodayDateTime!, EndDateTime: EndDateTime!)
        }
    }
    
    @objc func PauseApp()
    {
        print("Application is kept in background")
        
        endTimer()
    }
    
}

extension TimerViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 2
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
