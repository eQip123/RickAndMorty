//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation
import UIKit
import SnapKit
protocol LocationViewDelegate: AnyObject {
    func presentLocationList(location: [ResultLocation])
}

class LocationViewController: BaseFirstController {
    
    var presenter: LocationPresenterDelegate?
    private var arrayLocation = [ResultLocation]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        tableView.separatorColor = .clear
        tableView.backgroundView = UIImageView(image: UIImage(named: "1_background"))
        tableView.contentMode = .scaleAspectFit
        return tableView
    }()
    override func setupView() {
        view.addSubview(tableView)
        presenter?.getLocation()
        tableView.dataSource = self
        setupNavigationBar()
    }
    override func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Location"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
extension LocationViewController: LocationViewDelegate, UITableViewDataSource {
    
    func presentLocationList(location: [ResultLocation]) {
        arrayLocation = location
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LocationTableViewCell
        cell.setupCell(model: arrayLocation[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
}

