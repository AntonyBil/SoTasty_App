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
    
    var currentPage = 0 {
        //change the nextButton title
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [OnboardingSlide(title: "Delicius Dishes", description: "Experience a variety af amazing dishes from different cultures around the world.", image: UIImage(imageLiteralResourceName: "slide2")),
                  OnboardingSlide(title: "World-Class Chefs", description: "Ouer dishes are prepared by only the best.", image: UIImage(imageLiteralResourceName: "slide1")),
                  OnboardingSlide(title: "Instant World-Wide Delivery" , description: "Your orders will be delivered instantly irrespective of your location aronund the world.", image:UIImage(imageLiteralResourceName: "slide3"))
        ]

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - IBActions
    @IBAction func nextButtonClicked(_ sender: UIButton) {
       
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen     //change presentation style
            controller.modalTransitionStyle = .partialCurl      //change animation
            present(controller, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
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
    
    //make the pageControl change the position
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
   
    }
    
}
