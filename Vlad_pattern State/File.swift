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

le
    let textToReverse: String = textField.text ?? ""
    
    func reverse(textToReverse: String){ // -> String {
        let reversedText =  reverser.reverseTextFunc(textToReverse: textToReverse)
        label.text = reversedText
        appState = .result
