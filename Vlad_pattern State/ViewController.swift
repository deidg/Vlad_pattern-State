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
    
    var appState: State = .start {
        didSet {
            manageState(appState)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScreen()
        defaultConfiguration()
        manageState(appState)
    }
    
    let reverser = MyReverser()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .green
        textField.placeholder = "Enter your text"
        textField.textColor = .white
        textField.isEnabled = true
        return textField
    }()
    var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.textAlignment = .center
        return label
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Reverse", for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
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
            make.bottom.equalToSuperview().offset(-66)
        }
    }
    
    func defaultConfiguration() {
       print("hello from default config")
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    
    func manageState(_ state: State) {
        
       
        
        func startState() {
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                 view.endEditing(true)
         button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
             }
            print("START state initialied")
            func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) { //-> Bool {
                if let text = textField.text,
                   let textRange = Range(range, in: text) {
                    let updatedText = text.replacingCharacters(in: textRange, with: string)
                    appState = .fill
                }}
            
            
            button.isEnabled = true
            return
        }
        
        func fillState() {
            print("FILL state initialied")
            button.backgroundColor = .green
            button.isEnabled = false
            return
        }
   
        func resultState() { // (result: textToReverse) {
            print("RESULT state initialied")
            func reverseTextFunc(textToReverse: String) -> String {
                let text = String(textToReverse.reversed())
                return text
            }
            let reversedText = reverseTextFunc(textToReverse: textField.text ?? "")
            label.text = reversedText
            button.setTitle("Clear", for: .normal)
             startState()
            return
        }

        
        switch state {
        case .start:
            startState()
        case .fill: //(text: <#T##String#>):
            fillState()
        case .result: //(result: textToReverse)
            resultState()
        }
    }
    
    @objc func buttonPressed(sender: UIButton) {

        let textToReverse: String = textField.text ?? ""
        
        func reverse(textToReverse: String){ // -> String {
            let reversedText =  reverser.reverseTextFunc(textToReverse: textToReverse)
            label.text = reversedText
            return
        }
        reverse(textToReverse: textToReverse)
    }
    
    
}

extension ViewController {
    
    enum State {   // множество состояний для построения приложения через паттер State
        case start
        case fill //(text: String)
        case result(result: String)
    }
}


