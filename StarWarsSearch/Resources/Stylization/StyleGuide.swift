//
//  StyleGuide.swift
//  AestheticsPractice
//
//  Created by Brooke Kumpunen on 4/17/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

extension UIView {
    
    //To make a circle, make your object a 1:1 square, and make the radius 1/2 its width/height.
    func addCornerRadius(_ radius: CGFloat = 8) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
}
