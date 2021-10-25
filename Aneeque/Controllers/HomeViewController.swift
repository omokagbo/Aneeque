//
//  ViewController.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let searchImage: UIImageView = {
        let searchImage = UIImageView()
        searchImage.frame = CGRect(x: 10, y: 0, width: 20, height: 20)
        searchImage.tintColor = .systemGray
        searchImage.image = UIImage(systemName: "magnifyingglass")
        return searchImage
    }()
    
    var allButtonIsSelected = false
    
    var chairButtonIsSelected = false
    
    var tableButtonIsSelected = false
    
    var lampButtonIsSelected = false
    
    var floorButtonIsSelected = false
    
    private var itemViewModel: ItemViewModel = ItemViewModel()
    
    private let customColor = UIColor(red: 64/255, green: 59/255, blue: 88/255, alpha: 1)
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var allButton: UIButton!
    
    @IBOutlet weak var chairButton: UIButton!
    
    @IBOutlet weak var tableButton: UIButton!
    
    @IBOutlet weak var lampButton: UIButton!
    
    @IBOutlet weak var floorButton: UIButton!
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchField()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.title = "Best Furniture"
    }
    
    // MARK: - Actions
    
    @IBAction func didTapAllButton() {
        allButtonIsSelected = !allButtonIsSelected
        if allButtonIsSelected {
            allButton.backgroundColor = customColor
            allButton.tintColor = .white
        } else {
            allButton.backgroundColor = .white
            allButton.tintColor = customColor
        }
        chairButton.isSelected = false
        tableButton.isSelected = false
        lampButton.isSelected = false
        floorButton.isSelected = false
    }
    
    @IBAction func didTapChairButton() {
        chairButtonIsSelected = !chairButtonIsSelected
        if chairButtonIsSelected {
            chairButton.backgroundColor = customColor
            chairButton.tintColor = .white
        } else {
            chairButton.backgroundColor = .white
            chairButton.tintColor = customColor
        }
        allButton.isSelected = false
        tableButton.isSelected = false
        lampButton.isSelected = false
        floorButton.isSelected = false
    }
    
    @IBAction func didTapTableButton() {
        tableButtonIsSelected = !tableButtonIsSelected
        if tableButtonIsSelected {
            tableButton.backgroundColor = customColor
            tableButton.tintColor = .white
        } else {
            tableButton.backgroundColor = .white
            tableButton.tintColor = customColor
        }
        allButton.isSelected = false
        chairButton.isSelected = false
        lampButton.isSelected = false
        floorButton.isSelected = false
    }
    
    @IBAction func didTapLampButton() {
        lampButtonIsSelected = !lampButtonIsSelected
        if lampButtonIsSelected {
            lampButton.backgroundColor = customColor
            lampButton.tintColor = .white
        } else {
            lampButton.backgroundColor = .white
            lampButton.tintColor = customColor
        }
        allButton.isSelected = false
        chairButton.isSelected = false
        tableButton.isSelected = false
        floorButton.isSelected = false
    }
    
    @IBAction func didTapFloorButton() {
        floorButtonIsSelected = !floorButtonIsSelected
        if floorButtonIsSelected {
            floorButton.backgroundColor = customColor
            floorButton.tintColor = .white
        } else {
            floorButton.backgroundColor = .white
            floorButton.tintColor = customColor
        }
        allButton.isSelected = false
        chairButton.isSelected = false
        tableButton.isSelected = false
        lampButton.isSelected = false
    }
    
    // MARK: - Methods
    
    private func setupSearchField() {
        searchField.leftViewMode = .always
        searchField.leftView = searchImage
        searchField.delegate = self
    }
    
    private func setupTableView() {
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        itemsTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
    }
    
}

// MARK: - TableView Extensions

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemViewModel.allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        
        cell.setup(with: itemViewModel.allItems[indexPath.row])
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
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

// MARK: - TextField Delegate

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

// MARK: - ItemTableViewDelegate Extension

extension HomeViewController: ItemTableViewCellDelegate {
    
    func didTapLikeButton() {
        self.showDefaultAlert(title: "🤩", message: "Item has been added to favorites")
    }
    
    func didTapBuyButton() {
        self.showDefaultAlert(title: "Hurray! 🥳", message: "Item has been added to cart")
    }
    
}
