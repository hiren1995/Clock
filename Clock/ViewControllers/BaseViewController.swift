//
//  BaseViewController.swift
//  Clock
//
//  Created by LogicalWings Mac on 16/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var rippleShape = CAShapeLayer()
    var rippleShape2 = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func addRippleEffect(to referenceView: UIView) {
        /*! Creates a circular path around the view*/
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height))
        /*! Position where the shape layer should be */
        let shapePosition = CGPoint(x: referenceView.bounds.size.width / 2.0, y: referenceView.bounds.size.height / 2.0)
        
        rippleShape.bounds = CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height)
        rippleShape.path = path.cgPath
        rippleShape.fillColor = UIColor.clear.cgColor
        rippleShape.strokeColor = UIColor.purple.cgColor
        rippleShape.lineWidth = 4
        rippleShape.position = shapePosition
        rippleShape.opacity = 0
        
        /*! Add the ripple layer as the sublayer of the reference view */
        referenceView.layer.addSublayer(rippleShape)
        /*! Create scale animation of the ripples */
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        //scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1))
        scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1, 2, 1))
        /*! Create animation for opacity of the ripples */
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        opacityAnim.fromValue = 1
        opacityAnim.toValue = nil
        /*! Group the opacity and scale animations */
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnim, opacityAnim]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.duration = CFTimeInterval(1.0)
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        rippleShape.add(animation, forKey: "rippleEffect")
        
        
        //another moving ripple effect
        
        
        rippleShape2.bounds = CGRect(x: 0, y: 0, width: referenceView.bounds.size.width, height: referenceView.bounds.size.height)
        rippleShape2.path = path.cgPath
        rippleShape2.fillColor = UIColor.clear.cgColor
        rippleShape2.strokeColor = UIColor.purple.cgColor
        rippleShape2.lineWidth = 4
        rippleShape2.position = shapePosition
        rippleShape2.opacity = 0
        
        /*! Add the ripple layer as the sublayer of the reference view */
        referenceView.layer.addSublayer(rippleShape2)
        /*! Create scale animation of the ripples */
        let scaleAnim2 = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim2.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scaleAnim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.2, 2, 1))
        /*! Create animation for opacity of the ripples */
        let opacityAnim2 = CABasicAnimation(keyPath: "opacity")
        opacityAnim2.fromValue = 1
        opacityAnim2.toValue = nil
        /*! Group the opacity and scale animations */
        let animation2 = CAAnimationGroup()
        animation2.animations = [scaleAnim2, opacityAnim2]
        animation2.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation2.duration = CFTimeInterval(1.0)
        animation2.repeatCount = .infinity
        animation2.isRemovedOnCompletion = false
        rippleShape2.add(animation2, forKey: "rippleEffect")
        
    }
    
    func showAlert(message : String){
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
