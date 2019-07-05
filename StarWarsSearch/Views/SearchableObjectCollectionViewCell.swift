//
//  SearchableObjectCollectionViewCell.swift
//  StarWarsSearch
//
//  Created by Brooke Kumpunen on 4/20/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class SearchableObjectCollectionViewCell: UICollectionViewCell {
    
    //MARK: -IBOutlets
    @IBOutlet weak var objectTypeImageView: RoundImage!
    
    //MARK: -Methods
    
    func updateViews(with searchCategory: SearchCategory) {
        let category = searchCategory.rawValue
        objectTypeImageView.image = UIImage(named: category)
        self.backgroundColor = .clear
    }
}
