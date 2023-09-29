//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var dishesTableView: UITableView!
    
    //MARK: - Variables
    var category: DishCategory!
    var dishes: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    
}

extension ListDishesViewController{
    func initUI(){
        dishesTableView.delegate = self
        dishesTableView.dataSource = self
        dishesTableView.register(UINib(nibName: "DishListTableViewCell", bundle: nil), forCellReuseIdentifier: "DishListTableViewCell")
        title = category.title
        ProgressHUD.show()
        
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
                
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.dishesTableView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishListTableViewCell", for: indexPath) as! DishListTableViewCell
        cell.setupCell(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
