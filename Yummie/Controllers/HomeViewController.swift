//
//  HomeViewController.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    //MARK: - Variables
    var categories: [DishCategory] = []
    
    var populars: [Dish] = []
    
    var spesials: [Dish] = []
    
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
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.spesials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }

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
