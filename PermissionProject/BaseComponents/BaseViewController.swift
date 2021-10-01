//
//  BaseViewController.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 29.09.2021.
//

import UIKit

class BaseViewController<T>: UIViewController {
    
    var viewModel: T?
    
    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllerConfigurations()
        configureUI()
    }
    
    func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
    }
    
    func configureUI() {}
}
