//
//  OnboardingViewController.swift
//  So_Tasty
//
//  Created by apple on 02.05.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Properties
    var slides: [OnboardingSlide] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [OnboardingSlide(title: "Delicius Dishes", description: "Experience a variety af amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2.png")),
                  OnboardingSlide(title: "World-Class Chefs", description: "Ouer dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1.png")),
                  OnboardingSlide(title: "Instant World-Wide Delivery" , description: "Your orders will be delivered instantly irrespective of your location aronund the world.", image: #imageLiteral(resourceName: "slide3.png"))
        ]

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - IBActions
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
    }
    

}
//MARK: - CollectionViewDelegates
extension OnboardingViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifire, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
