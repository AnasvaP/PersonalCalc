//
//  ACalcViewModel.swift
//  aCalculator
//
//  Created by Anastasiia Poliukhovych on 04.12.2020.
//

import Foundation
import SwiftUI

class ACalcViewModel: ObservableObject {
    
    @Published public var enteredValue: String = ""
     private var value: [Double?] = [nil,nil]
     private var result: Double?
    @Published public var fullSampleForText: String = ""
    
    
    public func okButtAction() {
        print("ok button is pressed")
        if enteredValue != "" {
            if value[0] == nil {
                let _: () = (Double(enteredValue) != nil) ? value[0] = Double(enteredValue) : print("ERROR")
                print("value1 = \(String(describing: value[0]))")
                enteredValue = ""
                fullSampleForText += value[0]!.description + " "
            } else {
                value[1] = Double(enteredValue)
                print("value2 = \(String(describing: value[1]))")
                if fullSampleForText.last == " " {
                    fullSampleForText += value[1]!.description
                }
                else {
                    print("you cannot put this value")
                }
            }
        }
    }
    
    public func calc2Numbers(v1: Double?, v2: Double?, sign: String) -> Double{
        var result: Double?
            if v1 != nil && v2 != nil {
                if sign.elementsEqual("+") {
                    result = v1! + v2!
                }
                else if sign.elementsEqual("-") {
                    result = v1! - v2!
                }
                else if sign.elementsEqual("*") {
                    result = v1! * v2!
                }
            }
        return result!
    }
    
    public func actionMathSign(sign: String) {
        let textFromFullSample: [Substring] = fullSampleForText.split(separator: " ")
        if value[0] != nil && value[1] != nil{
            let result = calc2Numbers(v1: value[0], v2: value[1], sign: sign)
            enteredValue = ""
            value = [nil,nil]
            let newFullSampleText: String = textFromFullSample[0] + " " + sign + " " + textFromFullSample[1] + " = " + String(describing: result)
            fullSampleForText = newFullSampleText
        } else{
            if textFromFullSample.count == 5 {
                let result = calc2Numbers(v1: Double(textFromFullSample[0]), v2: Double(textFromFullSample[2]), sign: sign)
                let newFullSampleText: String = textFromFullSample[0] + " " + sign + " " + textFromFullSample[2] + " = " + String(describing: result)
                fullSampleForText = newFullSampleText
            }
            print("it should work better")
        }
    }
    
    public func actionDotBtn() {
        if enteredValue != ""  && !enteredValue.contains(".") {
            enteredValue += "."
        }
        else {
            print("you can not 2 . ")
        }
    }
    
    public func actionDeleteBtn() {
        let newEnteredValue: Substring = enteredValue.dropLast(1)
        print(newEnteredValue)
        enteredValue = newEnteredValue.description
    }
    
    public func actionLongPressDeleteBtn(){
        enteredValue = ""
    }
    
    public func actionNumericsBtn(numeric: Int) {
        enteredValue += String(numeric)
        if value[0] == nil && value[1] == nil {
            fullSampleForText = ""
        }
    }
    
}
