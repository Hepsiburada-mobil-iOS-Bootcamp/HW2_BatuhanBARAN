//
//  ViewController.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 26.09.2021.
//

import UIKit

class ViewController: UIViewController {

    private var cameraButton: ActionButton!
    private var buttonModule: ActionButtonModule!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        let buttonModuleData = ActionButtonModuleData(negativeButtonData: ActionButtonData(text: "No", buttonType: .outlined(.negative)), positiveButtonData: ActionButtonData(text: "Yes", buttonType: .filled(.smooth)))
        buttonModule = ActionButtonModule(frame: .zero)
        buttonModule.setData(with: buttonModuleData)
        view.addSubview(buttonModule)
        
        buttonModule.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            buttonModule.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonModule.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }

}

