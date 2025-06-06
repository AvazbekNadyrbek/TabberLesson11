//
//  TabViewController.swift
//  TabberLesson11
//
//  Created by Авазбек Надырбек уулу on 06.06.25.
//

import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .blue
        tabBar.tintColor = .white
        
        
        setTabs()
    }
    
    private func setTabs(){
        
        let homeVc = ViewController()
        homeVc.tabBarItem.title = "Home"
        homeVc.tabBarItem.image = UIImage(systemName: "homekit")
        homeVc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        let messageVc = MessageViewController()
        messageVc.tabBarItem.title = "Home2"
        messageVc.tabBarItem.image = UIImage(systemName: "message")
        messageVc.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        messageVc.tabBarItem.badgeValue = "10"
        let profileVc = ProfileViewController()
        profileVc.tabBarItem.title = "Home3"
        profileVc.tabBarItem.image = UIImage(systemName: "house")
        profileVc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        
        
        setViewControllers(
            [
                homeVc,
                messageVc,
                profileVc
            ],
            animated: false
        )
        
    }

}
