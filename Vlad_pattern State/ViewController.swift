//
//  ViewController.swift
//  Vlad_pattern State
//
//  Created by Alex on 02.02.2023.
//

import UIKit
import Foundation
import SnapKit




class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScreen()
        defaultConfiguration()
    }
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .green
        textField.placeholder = "Enter your text"
        textField.textColor = .white
        textField.isEnabled = true

        return textField
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Reverse", for: .normal)
        button.backgroundColor = .blue
        button.isEnabled = true
        return button
    }()
    
    // constraints
    func setupItemsOnScreen() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.center.equalToSuperview()
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(150)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
//            make.top.equalTo(answerTextView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-66)
        }
    }
    
    func defaultConfiguration() {
       print("hello from default config")
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    
    @objc func buttonPressed(sender: UIButton) {
//        func printing() {
//            label.text = textField.text
//            let textToReverse = textField.text
//            print("func printing valid and textToReverse - \(textToReverse ?? "")")
//            return
//        }
//        printing()
        let textToReverse = textField.text
        print("текст для разворота - \(textToReverse ?? "")")
        
//        func reverse(textToReverse: String) -> String {
//            let reversedText =  MyReverser.reverseTextFunc()
//            print(reversedText)
//        }
        let reversedText = MyReverser.reverseTextFunc(textToReverse: String)
        print(reversedText)
    }
    
    
}

