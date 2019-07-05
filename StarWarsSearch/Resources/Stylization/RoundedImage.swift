//
//  RoundedImage.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/20/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2.0
    }
    
}
