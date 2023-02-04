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
    
    var appState: StateEnum = .start {
        didSet {
            manageState(appState)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScreen()
        defaultConfiguration()
        manageState(appState)
        textField.delegate = self
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
        button.isEnabled = false
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
        print("default config loaded")
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    
    func manageState(_ state: StateEnum) {
        
        func startState() {
            print("State 1 (START state) initialied")
            
            label.text = ""
            textField.placeholder = "Enter your text"
            button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
            return
        }
        
        func fillState() {
            print("FILL state initialied")
            //            button.backgroundColor = .green
            button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            button.isEnabled = true
//            button.isEnabled = false
            return
        }
        
        func resultState() { // (result: textToReverse) {
            print("RESULT state initialied")
            button.setTitle("Clear", for: .normal)

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

//            startState()
            return
        }
        
        
        switch appState {  // switch в рамках manageState
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
            appState = .result
            print("статус appState перешёл в result")
            return
        }
        reverse(textToReverse: textToReverse)
        
//        func reset() {
//            appState = .start
//            label.text = ""
//            button.setTitle("Reverse", for: .normal)
//        }
//        reset()
        
        switch appState {   //switch  в рамках функции buttonPressed
        case .start:
            break
        case .fill:
            reverse(textToReverse: textToReverse)
        case .result:
//          reset()
            print("case result")
        }
    }
}

extension ViewController {
    
    enum StateEnum {   // множество состояний для построения приложения через паттер State
        case start
        case fill //(text: String)
        case result//(result: String)
    }
}

extension ViewController: UITextFieldDelegate {
    //отслеживает изменение текста в моменте
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if updatedText == "" {
                appState = .start
                
            } else {
                //                divider.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                appState = .fill // (text: updatedText)
                
            }
        }
        return true
    }
}
