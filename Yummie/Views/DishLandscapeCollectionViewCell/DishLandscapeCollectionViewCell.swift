//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    
    func setupCell(dish: Dish){
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        discriptionLbl.text = dish.description
        caloriesLbl.text = dish.formatedCalory
    }

}
