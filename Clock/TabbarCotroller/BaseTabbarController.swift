//
//  BaseTabbarController.swift
//  Clock
//
//  Created by LogicalWings Mac on 14/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    var firstItemImageView: UIImageView!
    var secondItemImageView: UIImageView!
    var thirdItemImageVIew: UIImageView!
    var fourthItemImageView: UIImageView!
    var fifthItemImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //delegate = self  // delegate for tabbarcontroller delegate
        
        // for changinf unselected img background and tabbar background
        
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.size.width / numberOfItems, height: tabBar.frame.size.height)
        
        //here the resizeable image Capinsets are set to fit properly in iphone X and above.
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.white, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0))
        
        // remove default border
        tabBar.frame.size.width = self.view.frame.width + 4
        tabBar.frame.origin.x = -2
        
        tabBar.unselectedItemTintColor = UIColor.white
        
        
        // for animations in tabbar items
       
        self.firstItemImageView = self.tabBar.subviews[0].subviews.first as? UIImageView
        self.firstItemImageView.contentMode = .center
        
        self.secondItemImageView = self.tabBar.subviews[1].subviews.first as? UIImageView
        self.secondItemImageView.contentMode = .center
        
        self.thirdItemImageVIew = self.tabBar.subviews[2].subviews.first as? UIImageView
        self.thirdItemImageVIew.contentMode = .center
        
        self.fourthItemImageView = self.tabBar.subviews[3].subviews.first as? UIImageView
        self.fourthItemImageView.contentMode = .center
        
        self.fifthItemImageView = self.tabBar.subviews[4].subviews.first as? UIImageView
        self.fifthItemImageView.contentMode = .center
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.tag == 1{
            
            
        }else if item.tag == 2{
            
            self.secondItemImageView.transform = CGAffineTransform.identity
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                
                self.secondItemImageView.transform = CGAffineTransform(rotationAngle: 50)
                
            }) { (true) in
                
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                    
                    self.secondItemImageView.transform = CGAffineTransform(rotationAngle: -50)
                    
                }) { (true) in
                    
                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                        
                        self.secondItemImageView.transform = CGAffineTransform(rotationAngle: 0)
                        
                    }) { (true) in
                        
                    }
                }
            }
            
        }else if item.tag == 3{
            
            self.thirdItemImageVIew.transform = CGAffineTransform.identity
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                
                self.thirdItemImageVIew.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                
            }) { (true) in
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                    
                    self.thirdItemImageVIew.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                }) { (true) in
                    
                }
            }
            
        }else if item.tag == 4{
            
            self.fourthItemImageView.transform = CGAffineTransform.identity
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                
                self.fourthItemImageView.transform = CGAffineTransform(rotationAngle: 600)
                
            }) { (true) in
                
            }
            
        }else{
            
            self.fifthItemImageView.transform = CGAffineTransform.identity
            
            UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
                
                self.fifthItemImageView.transform = CGAffineTransform(translationX: -5, y: 0)
                
            }) { (true) in
                
                UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {

                    self.fifthItemImageView.transform = CGAffineTransform(translationX: 5, y: 0)

                }) { (true) in

                }
            }

        }
    }

}

// Code for transitions between views of tabbar

/*
extension BaseTabbarController:UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false // Make sure you want this as false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionFlipFromRight], completion: nil)
        }
        
        return true
    }
}
*/
