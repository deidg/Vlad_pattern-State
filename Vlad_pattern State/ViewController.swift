//
//  ViewController.swift
//  Vlad_pattern State
//
//  Created by Alex on 02.02.2023.
//

import UIKit
//import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScreen()
        
    }
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        
        return textField
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Reverse", for: .normal)
        button.backgroundColor = .blue

        return button
    }()
    
    // constraints
    func setupItemsOnScreen() {
        view.addSubview(textField)
        textField.
    }
    
    @objc func buttonPressed(sender: UIButton) {
        
    }
    
    
}

