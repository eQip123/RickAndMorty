//
//  LocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 2/9/22.
//

import Foundation
import UIKit
class LocationTableViewCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 17, weight: .bold)
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubview() {
        self.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        titleLabel.center = center
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func setupCell(model: ResultLocation) {
        self.titleLabel.text = model.created
    }
}
