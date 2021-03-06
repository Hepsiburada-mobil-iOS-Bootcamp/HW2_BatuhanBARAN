//
//  PhotosPermissionManager.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 29.09.2021.
//

import Foundation
import PhotosUI

class PhotosPermissionManager: PermissionManagerProtocol {
    
    func requestPermission(with completion: @escaping VoidCompletionBlock) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    
                } else {
                    
                }
            })
        }
    }
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData {
        return PermissionMainViewData(
            image: PermissionImages.photos.value,
            labelComponentData: LabelPackComponentData(
                title: PermissionLocalizables.photosPermissionTitle.value,
                subTitle: PermissionLocalizables.photosPermissionSubTitle.value),
            actionButtonModuleData: ActionButtonModuleData(
                negativeButtonData: ActionButtonData(text: PermissionLocalizables.permissionNotNow.value, buttonType: .outlined(.bright)).setActionButtonListener(by: negativeListener),
                positiveButtonData: ActionButtonData(text: PermissionLocalizables.permissionOk.value, buttonType: .filled(.bright)).setActionButtonListener(by: positiveListener)))
        
    }
    
}
