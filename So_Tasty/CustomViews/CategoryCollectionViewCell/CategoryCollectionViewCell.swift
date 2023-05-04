//
//  CategoryCollectionViewCell.swift
//  So_Tasty
//
//  Created by apple on 03.05.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "CategoryCollectionViewCell"

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
