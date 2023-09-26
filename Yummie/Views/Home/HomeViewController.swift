//
//  HomeViewController.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    //MARK: - Variables
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Indomie", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Garri", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 104),
        .init(id: "id1", name: "Garri", discription: "This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 104),
        .init(id: "id1", name: "Piza", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 98)
    ]
    
    var spesials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", discription: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 306),
        .init(id: "id1", name: "Beans and Garri", discription: "This is the best i have ever tasted", image: "https://picsum.photos/100/200", calories: 394)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

}

extension HomeViewController{
    func initUI(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(UINib(nibName: "DishPortraiteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DishPortraiteCollectionViewCell")
        
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        specialsCollectionView.register(UINib(nibName: "DishLandscapeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DishLandscapeCollectionViewCell")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return spesials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.setupCell(category: categories[indexPath.row])
            return cell

        case popularCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishPortraiteCollectionViewCell", for: indexPath) as! DishPortraiteCollectionViewCell
            cell.setupCell(dish: populars[indexPath.row])
            return cell
            
        case specialsCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DishLandscapeCollectionViewCell", for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setupCell(dish: spesials[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : spesials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
