//
//  PermissionViewModel.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 29.09.2021.
//

import Foundation

class PermissionViewModel {
    
    private let manager: PermissionManagerProtocol
    private var permissionViewDismissActionBlock: VoidCompletionBlock?
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return manager.getPermissionMainViewData(with: negativeListenerHandler, with: positiveListenerHandler)
    }
    
    func listenManagerActions(with completion: @escaping VoidCompletionBlock) {
        permissionViewDismissActionBlock = completion
    }
    
    lazy var negativeListenerHandler: VoidCompletionBlock = { [weak self] in
        print("negative pressed")
        self?.permissionViewDismissActionBlock?()
    }
    
    lazy var positiveListenerHandler: VoidCompletionBlock = { [weak self] in
        print("positive pressed")
        self?.permissionViewDismissActionBlock?()
    }
}
