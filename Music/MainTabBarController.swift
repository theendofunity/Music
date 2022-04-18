//
//  MainTabBarController.swift
//  Music
//
//  Created by Дмитрий Дудкин on 19.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.tintColor = .systemPurple
        // Do any additional setup after loading the view.
        
        let searchViewController = SearchViewController()
        let searchImage = UIImage(systemName: "magnifyingglass")
        let libraryViewController = ViewController()
        let libraryImage = UIImage(systemName: "music.note.house")
        
        viewControllers = [
            createNavigationController(rootViewController: searchViewController, title: "Search", image: searchImage),
            createNavigationController(rootViewController: libraryViewController, title: "Library", image: libraryImage)
        ]
    }
    
    func createNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        
        return navigationController
    }
}
