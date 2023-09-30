//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var dishTitleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setupCell(dish: Dish){
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    func setup(order: Order) {
        dishImgView.kf.setImage(with: order.dish?.image?.asUrl)
        dishTitleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
}
