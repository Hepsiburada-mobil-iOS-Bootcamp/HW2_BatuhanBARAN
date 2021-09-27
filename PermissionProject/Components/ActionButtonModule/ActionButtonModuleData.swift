//
//  ActionButtonModuleData.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 27.09.2021.
//

import Foundation

class ActionButtonModuleData {
    
    private(set) var negativeButtonData: ActionButtonData
    private(set) var positiveButtonData: ActionButtonData
    
    init(negativeButtonData: ActionButtonData, positiveButtonData: ActionButtonData) {
        self.negativeButtonData = negativeButtonData
        self.positiveButtonData = positiveButtonData
    }
}
