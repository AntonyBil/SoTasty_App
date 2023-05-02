//
//  OnboardingCollectionViewCell.swift
//  So_Tasty
//
//  Created by apple on 02.05.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "onboardingCell"
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
}
