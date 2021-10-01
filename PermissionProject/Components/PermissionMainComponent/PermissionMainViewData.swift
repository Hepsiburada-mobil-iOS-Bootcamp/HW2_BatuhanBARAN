//
//  PermissionMainViewData.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 27.09.2021.
//

import UIKit

class PermissionMainViewData {
    
    private(set) var image: UIImage
    private(set) var labelComponentData: LabelPackComponentData
    private(set) var actionButtonModuleData: ActionButtonModuleData

    init(image: UIImage,labelComponentData: LabelPackComponentData, actionButtonModuleData: ActionButtonModuleData) {
        self.image = image
        self.labelComponentData = labelComponentData
        self.actionButtonModuleData = actionButtonModuleData
    }
}
