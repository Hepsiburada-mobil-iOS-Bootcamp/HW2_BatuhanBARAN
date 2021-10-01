//
//  CameraPermissionManager.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 29.09.2021.
//

import Foundation

class CameraPermissionManager: PermissionManagerProtocol {
    
    func requestPermission(with completion: @escaping VoidCompletionBlock) {
        print("request permission")
    }
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData {
        return PermissionMainViewData(image: PermissionImages.camera.value, labelComponentData: LabelPackComponentData(title: PermissionLocalizables.cameraPermissionTitle.value, subTitle: PermissionLocalizables.cameraPermissionSubTitle.value), actionButtonModuleData: ActionButtonModuleData(negativeButtonData: ActionButtonData(text: PermissionLocalizables.permissionNotNow.value, buttonType: .outlined(.negative)).setActionButtonListener(by: negativeListener), positiveButtonData: ActionButtonData(text: PermissionLocalizables.permissionOk.value, buttonType: .filled(.smooth)).setActionButtonListener(by: positiveListener)))
    }
}
