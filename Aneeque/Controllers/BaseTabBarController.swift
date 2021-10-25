//
//  BaseTabBarController.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        delegate = self
        
        setupTabBar()
        setupMiddleTabBar()
    }
   
    fileprivate func setupTabBar() {
        let firstTabBar = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        let secondTabBar = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartViewController")
        let thirdTabBar = UIStoryboard(name: "Favorites", bundle: nil).instantiateViewController(withIdentifier: "FavoritesViewController")
        let fourthTabBar = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
        
        firstTabBar.navigationItem.largeTitleDisplayMode = .always
        
        let firstNavBar = UINavigationController(rootViewController: firstTabBar)
        let secondNavBar = UINavigationController(rootViewController: secondTabBar)
        let thirdNavBar = UINavigationController(rootViewController: thirdTabBar)
        let fourthNavBar = UINavigationController(rootViewController: fourthTabBar)
        
        secondNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bag.fill"), tag: 1)
        thirdNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star.fill"), tag: 2)
        fourthNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.fill"), tag: 3)
        
        firstNavBar.navigationBar.prefersLargeTitles = true
        secondNavBar.navigationBar.prefersLargeTitles = true
        thirdNavBar.navigationBar.prefersLargeTitles = true
        fourthNavBar.navigationBar.prefersLargeTitles = true
        
        setViewControllers([firstNavBar, secondNavBar, thirdNavBar, fourthNavBar], animated: true)
        tabBar.backgroundColor = .white
        tabBar.alpha = 0.9
        tabBar.isTranslucent = true
        self.selectedViewController = firstNavBar
        tabBar.tintColor = .black
    }
    
    private let tabButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.cornerRadius = 35
        button.layer.shadowOpacity = 0.3
        return button
    }()
    
    func setupMiddleTabBar() {
        tabButton.frame = CGRect(x: 16, y: -35, width: 70, height: 70)
        tabButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        let buttonImage = UIImage(systemName: "house.fill")
        tabButton.setImage(buttonImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        
        tabBar.addSubview(tabButton)
        view.layoutIfNeeded()
    }
    
    @objc func didTapButton() {
        self.selectedIndex = 0
    }
}

