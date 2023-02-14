//
//  TabBarVC.swift
//  ProgrammaticUI
//
//  Created by İlker Kaya on 6.02.2023.
//

import UIKit

class TabBarVC: UITabBarController {
    
    private var tabItem = UITabBarItem()
    private var tabBarAppearance = UITabBar.appearance()
    private var tabBarItemAppearance = UITabBarItem.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let HomeVC = UINavigationController(rootViewController: HomeVC())
        let DiscoverVC = UINavigationController(rootViewController: DiscoverVC())
        let ProfileVC = UINavigationController(rootViewController: ProfileVC())
        
        viewControllers = [HomeVC, DiscoverVC, ProfileVC]
        setupTabBar()
        
        // tabs
        setupTabItem("home-bold", "home-outline", 0, "Home")
        setupTabItem("search-bold", "search-outline", 1, "Discover")
        setupTabItem("profile-bold", "profile-outline", 2, "Profile")
        
        tabBar.standardAppearance.shadowColor = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //tabBar.frame.origin.y = view.frame.height - 100
    }
    
    func setupTabBar(){
        
        tabBar.barTintColor = UIColor.white
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white
        tabBar.isTranslucent = true
        
        //width
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.layer.borderWidth = 0
        
        // radius
        tabBar.layer.cornerRadius = 40
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        tabBarAppearance.tintColor = .black
        tabBarAppearance.unselectedItemTintColor = .systemGray3
        
        additionalSafeAreaInsets.top = 20
    }
    
    func setupTabItem(_ activeImage: String, _ inactiveImage: String, _ index: Int,_ tabTitle: String){
        let selectedImage = UIImage(named: activeImage)?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage = UIImage(named: inactiveImage)?.withRenderingMode(.alwaysTemplate)
        deSelectedImage?.withTintColor(.systemGray3)
        tabItem = self.tabBar.items![index]
        tabItem.image = deSelectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = tabTitle
        tabItem.imageInsets.bottom = -10
        tabItem.imageInsets = UIEdgeInsets(top: -2, left: -10, bottom: -2, right: -10)
        tabItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 6)
    }
}

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 20
        return sizeThatFits
    }
}
