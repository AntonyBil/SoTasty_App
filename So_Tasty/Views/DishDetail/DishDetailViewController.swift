//
//  DishDetailViewController.swift
//  So_Tasty
//
//  Created by apple on 05.05.2023.
//

import UIKit
import ProgressHUD


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
//keyboard validation
    @IBAction func olaceOrderButtonTapped(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkManager.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}


