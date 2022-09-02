//
//  BaseSecondController.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 2/9/22.
//

import Foundation
import UIKit

class BaseSecondController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        tableView.backgroundView = UIImageView(image: UIImage(named: "1_background"))
        tableView.contentMode = .scaleAspectFit
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        view.backgroundColor = .white
    }
    open func setupView() {
        
    }
    open func setupConstraints() {
        
    }
    
}
