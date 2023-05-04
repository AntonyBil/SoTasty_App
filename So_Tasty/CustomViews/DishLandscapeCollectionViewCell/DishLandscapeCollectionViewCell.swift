//
//  DishLandscapeCollectionViewCell.swift
//  So_Tasty
//
//  Created by apple on 04.05.2023.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "DishLandscapeCollectionViewCell"

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup (dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    
    
}
