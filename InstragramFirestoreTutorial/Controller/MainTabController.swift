//
//  MainTabController.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 04/03/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    // Embed tab controllers to our view
    func configureViewControllers() {
        // Default background color
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        
        // Importing and initializing the view controllers
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())

        let notifications = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())

        
        //  Setting tabs of our MainTabController
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
        // Tab icon color
        tabBar.tintColor = .black
    }
    
    // Embed icons for each navigation tab
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        
        // Navigation bar
        let nav = UINavigationController(rootViewController: rootViewController)
        
        // When tab is inactive
        nav.tabBarItem.image = unselectedImage
        
        // When tab is active
        nav.tabBarItem.selectedImage = selectedImage
        
        // Tab icon color
        nav.navigationBar.tintColor = .red
        
        return nav
    }
    
}
