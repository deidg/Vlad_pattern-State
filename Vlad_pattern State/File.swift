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


//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //     view.endEditing(true)
//        button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
//        appState = .fill
//    }
//
//}


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


/*

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) { //-> Bool {
if let text = textField.text,
let textRange = Range(range, in: text) {
let updatedText = text.replacingCharacters(in: textRange, with: string)
}

}



*/



// начать с обдумывания экранов
