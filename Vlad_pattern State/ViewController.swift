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
            manageState(state)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScreen()
        defaultConfiguration()
        
//        startState()
//        fillState()
//        resultState()
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
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.textAlignment = .center
        return label
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Reverse", for: .normal)
        button.backgroundColor = UIColor(red: 199, green: 199, blue: 255, alpha: 0.6)
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
    
    
    func manageState(_ state: State) {
        
       
        
        func startState() {
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                 view.endEditing(true)
             }
            
            print("START state initialied")
            button.isEnabled = true
            return
        }
        
        func fillState() {
            print("FILL state initialied")

            button.isEnabled = false
            button.backgroundColor = UIColor(red: 199, green: 199, blue: 255, alpha: 1)

            return
        }
   
        func resultState(result: result) {
            print("RESULT state initialied")
            
            
            State = .start
            return
        }

        
        switch state {
        case .start:
            startState()
        case .fill: //(text: <#T##String#>):
            fillState()
        case .result: (result: result)
            resultState()
        }
        
        
    }
    
    
    
    
    
    @objc func buttonPressed(sender: UIButton) {

        let textToReverse: String = textField.text ?? ""
        print("текст для разворота - \(textToReverse )")
        
        func reverse(textToReverse: String){ // -> String {
            let reversedText =  reverser.reverseTextFunc(textToReverse: textToReverse)
            print("развернутый текст - \(reversedText)")
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

func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     view.endEditing(true)
 }
