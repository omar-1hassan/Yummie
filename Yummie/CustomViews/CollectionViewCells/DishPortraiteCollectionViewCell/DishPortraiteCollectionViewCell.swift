//
//  DishPortraiteCollectionViewCell.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import UIKit

class DishPortraiteCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    func setupCell(dish: Dish) {
        titleLbl.text = dish.name
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formatedCalory
        discriptionLbl.text = dish.discription
    }
}
