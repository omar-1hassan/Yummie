//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var orders: [Order] = [
        .init(id: "id", name: "Omar Mohamed", dish: .init(id: "id1", name: "Indomie", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "id", name: "Ahmed Mohamed", dish: .init(id: "id1", name: "Beans and Garrie", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "id", name: "Ibrahim Mohamed", dish: .init(id: "id1", name: "Fride Yam", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 34)),

    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }


}

extension ListOrdersViewController{
    func initUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DishListTableViewCell", bundle: nil), forCellReuseIdentifier: "DishListTableViewCell")
        title = "Orders"
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishListTableViewCell", for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
