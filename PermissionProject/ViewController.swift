//
//  ViewController.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 26.09.2021.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func photoTapped(_ sender: Any) {
        self.present(PermissionViewBuilder.build(), animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        self.present(PermissionViewBuilder.build(), animated: true, completion: nil)
    }
    
}

