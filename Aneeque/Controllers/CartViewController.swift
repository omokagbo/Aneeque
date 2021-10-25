//
//  CartViewController.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: - Properties
    
    private let itemViewModel: ItemViewModel = ItemViewModel()
    
    // MARK: - Outlets
    
    @IBOutlet weak var cartTableView: UITableView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Methods
    
    private func setupTableView() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
    }
    
}

// MARK: - TableView Extensions

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemViewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        cell.setup(with: itemViewModel.cartItems[indexPath.row])
        
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let itemDetailsViewController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        
        itemDetailsViewController.tabBarController?.hidesBottomBarWhenPushed = true
        
        itemDetailsViewController.item = itemViewModel.allItems[indexPath.row]
        
        navigationController?.pushViewController(itemDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        242
    }
}


// MARK: - ItemTableViewDelegate Extension

extension CartViewController: ItemTableViewCellDelegate {
    
    func didTapLikeButton() {
        self.showDefaultAlert(title: "🤩", message: "Item has been added to favorites")
    }
    
    func didTapBuyButton() {
        self.showDefaultAlert(title: "Heeey! 🥳", message: "Item is already in cart")
    }
    
}
