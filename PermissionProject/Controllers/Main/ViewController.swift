//
//  ViewController.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 26.09.2021.
//

import UIKit

class ViewController: BaseViewController<MainViewModel> {
    
    private var cameraButton: ActionButton!
    private var photoButton: ActionButton!
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [cameraButton, photoButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fillEqually
        temp.axis = .vertical
        temp.spacing = 25
        return temp
    }()
    
    override func configureUI() {
        super.configureUI()
        
        viewModel = MainViewModel()
        viewModel?.delegate = self
        
        cameraButton = ActionButton(frame: .zero, data: viewModel?.setButtonData(buttonType: .camera))
        photoButton = ActionButton(frame: .zero, data: viewModel?.setButtonData(buttonType: .photos))
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            cameraButton.widthAnchor.constraint(equalToConstant: 230),
            cameraButton.heightAnchor.constraint(equalToConstant: 50),
            
            photoButton.widthAnchor.constraint(equalToConstant: 230),
            photoButton.heightAnchor.constraint(equalToConstant: 50),
            
            mainStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            mainStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        ])
    }
}

extension ViewController: MainViewModelOutputDelegate {
    func tappedButton(buttonTitle: String) {
        switch buttonTitle {
        case "Camera":
            self.present(PermissionViewBuilder.build(with: .camera), animated: true, completion: nil)
        case "Photos":
            self.present(PermissionViewBuilder.build(with: .photos), animated: true, completion: nil)
        default:
            break
        }
    }
}
