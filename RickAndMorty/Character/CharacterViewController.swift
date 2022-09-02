//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation
import UIKit
import SnapKit

protocol CharacterViewDelegate: AnyObject {
    func presentCharacterList(characterList: [ResultReq])
    func showError(message: String)
    func isProgress(isShow: Bool)
}
class CharacterViewController: BaseFirstController {
     var presenter: CharacterPresenterDelegate!
    private var character = [ResultReq]()

    override func setupView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        presenter.getCharacterList()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rick and Morty"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    override func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension CharacterViewController: CharacterViewDelegate {
    func presentCharacterList(characterList: [ResultReq]) {
        character = characterList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print(characterList)
    }
    
    func showError(message: String) {
        print(message)
    }
    
    func isProgress(isShow: Bool) {
        if isShow {
            self.showProgress()
        } else {
            self.hideProgress()
        }
    }
}
extension CharacterViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CharacterTableViewCell
        cell.setupCell(model: character[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
