//
//  CharacterBuilder.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation
import UIKit

class CharacterBuilder {
    static func build() -> UIViewController {
        let characterVC = CharacterViewController()
        let api = ApiCharacter()
        let characterPresenter = CharacterPresenter(view: characterVC, api: api)
        characterVC.presenter = characterPresenter
        characterVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "1.circle"), tag: 0)
        return characterVC
    }
}
