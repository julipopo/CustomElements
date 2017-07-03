//
//  JSSwitchh.swift
//  JSSwitch
//
//  Created by julien simmer on 6/19/17.
//  Copyright © 2017 julien simmer. All rights reserved.
//

import UIKit

@IBDesignable
class JSSwitch: UIView {
    
    var imageStateOn : UIImage = UIImage()
    var imageStateOff : UIImage = UIImage()
    var backgroundImageView : UIImageView = UIImageView()
    let borderBall : CGFloat = 4
    var isOn : Bool = false
    let ball = CALayer()
    var h:CGFloat = 0
    var w:CGFloat = 0
    var ballSize : CGFloat = 0
    
    @IBInspectable var onImage: UIImage? {
        get {
            return imageStateOn
        }
        set {
            imageStateOn = newValue!
        }
    }
    @IBInspectable var offImage: UIImage? {
        get {
            return imageStateOff
        }
        set {
            imageStateOff = newValue!
        }
    }
    @IBInspectable var value: Bool? {
        get {
            return isOn
        }
        set {
            isOn = newValue!
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(withImageOn : String, withImageOff : String, inRect: CGRect){
        imageStateOn = UIImage.init(named: withImageOn)!
        imageStateOff = UIImage.init(named: withImageOff)!
        
        super.init(frame: inRect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        h = rect.height
        w = rect.width
        ballSize = h-2*borderBall
        
        backgroundImageView.image = imageStateOff
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: w, height: h)
        self.addSubview(backgroundImageView)
        
        layer.cornerRadius = h/2
        layer.masksToBounds = true
        
        ball.frame = CGRect(x: borderBall, y: borderBall, width: ballSize, height: ballSize)
        ball.cornerRadius = ballSize/2
        ball.backgroundColor = UIColor.groupTableViewBackground.cgColor
        layer.addSublayer(ball)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CustomSwitch.handleTap))
        //tap.delegate = self as! UIGestureRecognizerDelegate
        self.addGestureRecognizer(tap)
    }
    
    func handleTap() {
        isOn = !isOn
        
        UIView.animate(withDuration: 0.4, animations: {
            self.ball.frame = self.isOn ? CGRect(x: self.w-self.ballSize-self.borderBall, y: self.borderBall, width: self.ballSize, height: self.ballSize) : CGRect(x: self.borderBall, y: self.borderBall, width: self.ballSize, height: self.ballSize)
            self.backgroundImageView.image = self.isOn ? self.imageStateOn : self.imageStateOff
        })
    }
}
