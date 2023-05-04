//
//  DishPortreitCollectionViewCell.swift
//  So_Tasty
//
//  Created by apple on 04.05.2023.
//

import UIKit

class DishPortreitCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "DishPortreitCollectionViewCell"

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
}
