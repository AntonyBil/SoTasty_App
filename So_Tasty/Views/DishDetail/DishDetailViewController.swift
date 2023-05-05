//
//  DishDetailViewController.swift
//  So_Tasty
//
//  Created by apple on 05.05.2023.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var calorieslbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        calorieslbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }

    @IBAction func olaceOrderButtonTapped(_ sender: UIButton) {
    }
}
