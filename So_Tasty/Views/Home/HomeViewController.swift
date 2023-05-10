//
//  HomeViewController.swift
//  So_Tasty
//
//  Created by apple on 03.05.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55),
        .init(id: "id1", name: "Indomie", description: "This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted, This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 220),
        .init(id: "id1", name: "Pizza", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 1240)
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Plantain", description: "This is my favourit dish.", image: "https://picsum.photos/100/200", calories: 220),
        .init(id: "id1", name: "Beans and Garri", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 1240)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.myFirstRequest { (result) in
            switch result {
            case .success(let data):
                for dish in data {
                    print(dish.name ?? "")
                }
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        registerCells()

    }
    
    // registration CategoryCollectionViewCell
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifire)
        
        popularCollectionView.register(UINib(nibName: DishPortreitCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: DishPortreitCollectionViewCell.identifire)
        
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifire)
    }
 

}

//MARK: - CollectionViewDelegates
extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifire, for: indexPath)
                as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortreitCollectionViewCell.identifire, for: indexPath) as! DishPortreitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifire, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
