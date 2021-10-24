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
    
    var isSelected = false
    
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
    
    // MARK: - Actions
    
    @IBAction func didTapAllButton() {
        print("all button tapped")
    }
    
    @IBAction func didTapChairButton() {
        print("chair button tapped")
    }
    
    @IBAction func didTapTableButton() {
        print("table button tapped")
    }
    
    @IBAction func didTapLampButton() {
        print("lamp button tapped")
    }
    
    @IBAction func didTapFloorButton() {
        print("floor button tapped")
    }
    
    // MARK: - Methods
    
    private func setupSearchField() {
        searchField.leftViewMode = .always
        searchField.leftView = searchImage
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        242
    }
}

// MARK: - ItemTableViewDelegate Extension

extension HomeViewController: ItemTableViewCellDelegate {
    
    func didTapLikeButton() {
        print("Like button tapped")
    }
    
    func didTapBuyButton() {
        self.showDefaultAlert(title: "Hurray!", message: "Item has been added to cart")
    }
    
}
