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
    
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 55),
        .init(id: "id1", name: "Indomie", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 220),
        .init(id: "id1", name: "Pizza", description: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 1240)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        registerCells()

    }
    
    // registration CategoryCollectionViewCell
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifire)
        
        popularCollectionView.register(UINib(nibName: DishPortreitCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: DishPortreitCollectionViewCell.identifire)
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
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}
