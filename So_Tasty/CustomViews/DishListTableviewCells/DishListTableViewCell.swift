//
//  DishListTableViewCell.swift
//  So_Tasty
//
//  Created by apple on 07.05.2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifire = "DishListTableViewCell"

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
}
