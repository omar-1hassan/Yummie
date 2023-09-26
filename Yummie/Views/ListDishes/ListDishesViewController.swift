//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit

class ListDishesViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var dishesTableView: UITableView!
    
    //MARK: - Variables
    var category: DishCategory!
    var dishes: [Dish] = [
        .init(id: "id1", name: "Indomie", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Garri", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 104),
        .init(id: "id1", name: "Garri", discription: "This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 104),
        .init(id: "id1", name: "Piza", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 98)
    
    ]
    
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
        title = category.name
        
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
