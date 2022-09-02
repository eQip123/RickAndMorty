//
//  TableViewCell.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 1/9/22.
//

import UIKit
import Kingfisher
class CharacterTableViewCell: UITableViewCell {
    
    private lazy var myImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 120
        image.image = UIImage(systemName: "")
        image.contentMode = .scaleAspectFit
        return image
    }()
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
        self.addSubview(myImageView)
        myImageView.frame = CGRect(x: 10, y: 5, width: 100, height: 90)
        titleLabel.frame = CGRect(x: 120, y: 20, width: 300, height: 20)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func setupCell(model: ResultReq) {
        self.titleLabel.text = model.name
        self.myImageView.kf.setImage(with: URL(string: model.image ?? ""))
    }
}
