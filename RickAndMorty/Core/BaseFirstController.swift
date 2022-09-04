//
//  BaseController.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation
import UIKit
import JGProgressHUD

class BaseFirstController: UIViewController {
    private lazy var progressView: JGProgressHUD = {
        let view = JGProgressHUD()
        view.style = .light
        view.backgroundColor = .colorShadow
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    func showProgress() {
        progressView.show(in: view)
    }
    func hideProgress() {
        progressView.dismiss(animated: true)
    }
    open func setupConstraints() {
        
    }
    open func setupView() {
        
    }
}
