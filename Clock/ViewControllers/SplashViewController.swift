//
//  SplashViewController.swift
//  Clock
//
//  Created by LogicalWings Mac on 15/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblAppName: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.isHidden = true
        lblAppName.isHidden = true
        
        // Do any additional setup after loading the view.
    }
   
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
            
            self.imgIcon.transform = CGAffineTransform(scaleX: 8.0, y: 8.0)
            
        }) { (true) in
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                
                self.imgIcon.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
                
            }) { (true) in
                
                self.lblAppName.isHidden = false
                
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                    
                    self.lblAppName.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                    
                }) { (true) in
                    
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                        
                        self.lblAppName.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                        
                    }) { (true) in
                        
                        self.lblName.isHidden = false
                        
                        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                            
                            self.lblName.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                            
                        }) { (true) in
                            
                            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                                
                                self.lblName.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                                
                            }, completion: { (true) in
                                
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let baseTabbarController = storyboard.instantiateViewController(withIdentifier: "baseTabbarController") as! BaseTabbarController
                                self.present(baseTabbarController, animated: true, completion: nil)
                            })
                        }
                    }
                }
            }
        }
    }
}
