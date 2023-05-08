//
//  ListOrdersViewController.swift
//  So_Tasty
//
//  Created by apple on 08.05.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "Antony Bil", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55)),
        .init(id: "id", name: "Vita Bil", dish: .init(id: "id1", name: "Burger", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55)),
        .init(id: "id", name: "Oxy Bil", dish: .init(id: "id1", name: "Pizza", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55)),
        .init(id: "id", name: "Nicole Bil", dish: .init(id: "id1", name: "Sushi", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55)),
        .init(id: "id", name: "Jim Bil", dish: .init(id: "id1", name: "Spring salads", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55)),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifire, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifire)
    }
    
}

extension ListOrdersViewController: UITableViewDelegate,
                                    UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifire, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
