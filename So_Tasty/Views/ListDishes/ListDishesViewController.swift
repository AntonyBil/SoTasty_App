//
//  ListDishesViewController.swift
//  So_Tasty
//
//  Created by apple on 07.05.2023.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55),
        .init(id: "id1", name: "Indomie", description: "This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 220),
        .init(id: "id1", name: "Pizza", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 1240)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()

    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifire)
    }
    
}

extension ListDishesViewController: UITableViewDelegate,
                                    UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifire, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
