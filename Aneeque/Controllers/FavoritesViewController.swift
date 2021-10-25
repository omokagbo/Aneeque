//
//  FavoritesViewController.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let itemViewModel: ItemViewModel = ItemViewModel()
    
    // MARK: - Outlets
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Methods
    
    private func setupTableView() {
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        favoritesTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
    }
}

// MARK: - TableView Extensions

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemViewModel.favoriteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        cell.setup(with: itemViewModel.favoriteItems[indexPath.row])
        
        cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let itemDetailsViewController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        
        itemDetailsViewController.tabBarController?.hidesBottomBarWhenPushed = true
        
        itemDetailsViewController.item = itemViewModel.favoriteItems[indexPath.row]
        
        navigationController?.pushViewController(itemDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        242
    }
}


// MARK: - ItemTableViewDelegate Extension

extension FavoritesViewController: ItemTableViewCellDelegate {
    
    func didTapLikeButton() {
        self.showDefaultAlert(title: "🤩", message: "Item is already a favorite")
    }
    
    func didTapBuyButton() {
        self.showDefaultAlert(title: "Hurray! 🥳", message: "Item has been added to cart")
    }
    
}
