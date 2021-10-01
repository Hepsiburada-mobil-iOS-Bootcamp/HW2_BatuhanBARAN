//
//  MainViewModel.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 1.10.2021.
//

import Foundation

protocol MainViewModelOutputDelegate: AnyObject {
    func tappedButton(buttonTitle: String)
}

class MainViewModel {
    
    var permissionViewDismissActionBlock: (String) -> Void = { _ in }
    weak var delegate: MainViewModelOutputDelegate?
    
    func setButtonData(buttonType: PermissionType) -> ActionButtonData {
        switch buttonType {
        case .camera:
            return ActionButtonData(text: "Camera", buttonType: .filled(.bright)).setActionButtonListener(by: cameraListener)
        case .photos:
            return ActionButtonData(text: "Photos", buttonType: .filled(.smooth)).setActionButtonListener(by: photosListener)
        }
    }
    
    lazy var photosListener: VoidCompletionBlock = { [weak self] in
        print("photosListener pressed")
        self?.delegate?.tappedButton(buttonTitle: "Photos")
    }
    
    lazy var cameraListener: VoidCompletionBlock = { [weak self] in
        print("cameraListener pressed")
        self?.delegate?.tappedButton(buttonTitle: "Camera")
    }
}
