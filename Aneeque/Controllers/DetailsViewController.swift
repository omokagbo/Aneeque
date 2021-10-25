//
//  DetailsViewController.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    public var item: Item?
    
    // MARK: - Outlets
    
    @IBOutlet weak var itemLargeImage: UIImageView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemImage2: UIImageView!
    
    @IBOutlet weak var itemImage3: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemSeller: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemQuantiy: UILabel!
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationAndTabBar()
        navigationItem.largeTitleDisplayMode = .never
        setupView()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapMinus(_ sender: UIButton) {
        guard let qty = itemQuantiy.text else { return }
        guard var quantity = Int(qty) else { return }
        quantity -= 1
        if quantity <= 0 {
            quantity = 1
        }
        itemQuantiy.text = "\(quantity)"
    }
    
    @IBAction func didTapPlus(_ sender: UIButton) {
        guard let qty = itemQuantiy.text else { return }
        guard var quantity = Int(qty) else { return }
        quantity += 1
        itemQuantiy.text = "\(quantity)"
    }
    
    // MARK: - Methods
    
    private func setupNavigationAndTabBar() {
        navigationController?.navigationBar.tintColor = .label
        self.navigationController?.navigationBar.topItem?.title = " "
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(didTapHeart))
        navigationController?.navigationBar.tintColor = .red
    }
    
    private func setupView() {
        guard let item = item else { return }
        itemLargeImage.image = UIImage(named: item.itemImage)
        itemImage.image = UIImage(named: item.itemImage)
        itemImage2.image = UIImage(named: item.itemImage)
        itemImage3.image = UIImage(named: item.itemImage)
        itemName.text = item.itemName
        itemSeller.text = "by \(item.itemSeller)"
        itemPrice.text = item.itemPrice
    }
    
    @objc private func didTapHeart() {}
    
    
    
}
