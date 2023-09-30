//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit
import ProgressHUD
import Kingfisher

class DishDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    //MARK: - Variables
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        
    }
    
    private func populateView(){
        dishImgView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        discriptionLbl.text = dish.description
        caloriesLbl.text = dish.formatedCalory
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please Enter Your Name!")
            return
        }
        ProgressHUD.show("Placing Order....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been recived! 👨🏻‍🍳")
                
            case .failure(let error):
                print("The error is: \(error)")
            }
        }
    }
}
