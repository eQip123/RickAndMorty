//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configureTabBarItem()
        tabBar.tintColor = .purple
    }
    
    private func configureTabBarItem() {
        let characterVC = CharacterBuilder.build()
        let locationVC = LocationBuilder.build()
        
        let characterNavVC = UINavigationController(rootViewController: characterVC)
        let locationNavVc = UINavigationController(rootViewController: locationVC)
        setViewControllers([characterNavVC, locationNavVc], animated: true)
    }
}
