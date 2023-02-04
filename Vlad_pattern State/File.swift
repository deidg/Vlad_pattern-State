//
//  File.swift
//  Vlad_pattern State
//
//  Created by Alex on 04.02.2023.
//

import Foundation
verride func viewDidLoad() {
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
    //        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
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
//            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
//            button.addTarget(self, action: #selector(buttonPressed(sender: button)), for: .touchUpInside)

        button.isEnabled = true
//            button.isEnabled = false
        return
    }
    
    func resultState() { // (result: textToReverse) {
        print("RESULT state initialied")
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        button.setTitle("Clear", for: .normal)
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
