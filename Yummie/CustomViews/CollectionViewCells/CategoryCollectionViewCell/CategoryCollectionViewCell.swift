//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var categoryImgView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setupCell(category: DishCategory){
        categoryTitleLbl.text = category.name
        categoryImgView.kf.setImage(with: category.image?.asUrl)
    }
    
}
