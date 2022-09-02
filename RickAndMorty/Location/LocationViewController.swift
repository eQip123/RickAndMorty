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

class LocationViewController: BaseSecondController {
    var presenter: LocationPresenterDelegate?
    private var arrayLocation = [ResultLocation]()
    override func setupView() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    override func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
extension LocationViewController: LocationViewDelegate, UITableViewDataSource {
    
    func presentLocationList(location: [ResultLocation]) {
        arrayLocation = location
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("---------------------- \(location)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LocationTableViewCell
        cell.setupCell(model: arrayLocation[indexPath.row])
        return cell
    }
}

