//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    private func populateView(){
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        discriptionLbl.text = dish.discription
        caloriesLbl.text = dish.formatedCalory
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
    }
    


}
