//
//  JSGradient.swift
//  JSGradient
//
//  Created by Julien Simmer  on 18/11/2016.
//  Copyright © 2016 Julien Simmer . All rights reserved.
//

import UIKit

@IBDesignable
class JSGradient: UIView {
    
    var firstColor = UIColor()
    var secondColor = UIColor()
    let JSGradientLayer = CAGradientLayer()
    
    @IBInspectable var Color1: UIColor? {
        get {
            return firstColor
        }
        set {
            firstColor = newValue!
        }
    }
    
    @IBInspectable var Color2: UIColor? {
        get {
            return secondColor
        }
        set {
            secondColor = newValue!
        }
    }
    
    @IBInspectable var Vertical: Bool? {
        get {
            return JSGradientLayer.startPoint == CGPoint(x: 0.5, y: 0) && JSGradientLayer.endPoint == CGPoint(x: 0.5, y: 1)
        }
        set {
            JSGradientLayer.startPoint = newValue! ? CGPoint(x: 0.5, y: 0) : CGPoint(x: 0, y: 0.5)
            JSGradientLayer.endPoint = newValue! ? CGPoint(x: 0.5, y: 1) : CGPoint(x: 1, y: 0.5)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Color1 = UIColor.init(red: 0, green: 0.5, blue: 1, alpha: 1)
        Color2 = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        Vertical = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        JSGradientLayer.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        JSGradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.addSublayer(JSGradientLayer)
    }
    
}
