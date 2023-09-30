//
//  OnBoardingCollectionViewCell.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var slideImgView: UIImageView!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    @IBOutlet weak var slideTitleLbl: UILabel!
    
    func setUp(_ slide: OnBoardingSlide) {
        slideImgView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.drscription
    }
}
