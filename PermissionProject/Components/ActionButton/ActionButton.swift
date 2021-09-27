//
//  ActionButton.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 26.09.2021.
//

import UIKit

class ActionButton: GenericBaseView<ActionButtonData> {
    
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var infoTitle: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = UIFont.boldSystemFont(ofSize: 16)
        temp.contentMode = .center
        temp.textAlignment = .center
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addContainerView()
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        addTapGesture()
    }
    
    
    private func addContainerView() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)
        containerView.addSubview(infoTitle)
        
        NSLayoutConstraint.activate([
            
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor),
            
            infoTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            infoTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
        ])
    }
    
    private func pressedButtonAction() {
        guard let data = returnData() else { return }
        data.actionButtonListener?()
    }
    
    override func loadDataView() {
        guard let data = returnData() else {
            return
        }
        
        self.infoTitle.text = data.text
        
        switch data.buttonType {
        case .filled(let theme):
            containerView.backgroundColor = theme.value
            infoTitle.textColor = .white
        case .outlined(let theme):
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = theme.value.cgColor
            containerView.backgroundColor = .white
            infoTitle.textColor = theme.value
        }
    }
}

extension ActionButton: UIGestureRecognizerDelegate {
    
    func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: .buttonTappedSelector)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonAction(){
        isUserInteractionEnabled = false
        startTappedAnimation { status in
            if status {
                self.isUserInteractionEnabled = true
                self.pressedButtonAction()
            }
        }
    }
}

fileprivate extension Selector {
    static let buttonTappedSelector = #selector(ActionButton.buttonAction)
}
