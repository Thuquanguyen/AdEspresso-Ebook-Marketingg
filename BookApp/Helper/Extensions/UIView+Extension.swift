//
//  UIView+Extension.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomView: UIView {
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1, height: 1) {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var isShadow: Bool = false {
        didSet {
            if isShadow {
                self.layer.shadowColor = UIColor.lightGray.cgColor
                self.layer.shadowOffset = shadowOffset
                self.layer.shadowOpacity = shadowOpacity
                self.layer.shadowRadius = shadowRadius
            } else {
                self.layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func setupUI() {
        if self.isShadow {
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOffset = shadowOffset
             self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowRadius = cornerRadius
            self.layer.masksToBounds = false
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    }
}

extension UIView {
    func addShadow(with color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    func removeShadow() {
        layer.shadowOpacity = 0
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
