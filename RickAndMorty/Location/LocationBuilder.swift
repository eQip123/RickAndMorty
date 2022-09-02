//
//  LocationBuilder.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 2/9/22.
//

import Foundation
import UIKit
// Builder

class LocationBuilder {
    static func build() -> UIViewController {
        let locationVC = LocationViewController()
        let apiLocation = ApiLocation()
        let locationPresenter = LocationPresenter(view: locationVC, api: apiLocation)
        locationVC.presenter = locationPresenter
        locationVC.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "2.circle"), tag: 1)
        return locationVC
    }
}
