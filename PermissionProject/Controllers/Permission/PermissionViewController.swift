//
//  PermissionViewController.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 28.09.2021.
//

import UIKit

class PermissionViewController: UIViewController {

    private var permissionMainView: PermissionMainView!
    private var permissionMainViewData: PermissionMainViewData!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        permissionMainViewData = PermissionMainViewData(image: UIImage(named: "camera_")!, labelComponentData: LabelPackComponentData(title: PermissionLocalizables.photosPermissionTitle.value, subTitle: PermissionLocalizables.photosPermissionSubTitle.value), actionButtonModuleData: ActionButtonModuleData(negativeButtonData: ActionButtonData(text: "No", buttonType: .outlined(.negative)), positiveButtonData: ActionButtonData(text: "Yes", buttonType: .filled(.smooth))))
        permissionMainView = PermissionMainView(frame: .zero)
        permissionMainView.setData(with: permissionMainViewData)
        permissionMainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(permissionMainView)
        
        NSLayoutConstraint.activate([
            permissionMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            permissionMainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            permissionMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
