//
//  CalcLogical.swift
//  Calculadora
//
//  Created by Alexandre Dimas on 26/11/25.
//

import SwiftUI
import Foundation


class CalcLogical: ObservableObject {
    
    @Published var display: String = "0"
    @Published var previousValue: Double? = nil
    @Published var currentOperator: String? = nil
    @Published var isTypingNumber = false
    
    //  FORMATAÇÃO
    private func format(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        }
        return String(value)
    }
    
    
    //  OPERAÇÕES
    func setOperator(_ op: String) {
        previousValue = Double(display)
        currentOperator = op
        isTypingNumber = false
    }
    
    
    func calculate() {
        guard
            let op = currentOperator,
            let prev = previousValue,
            let curr = Double(display)
        else { return }
        
        var result = prev
        
        switch op {
        case "+": result = prev + curr
        case "-": result = prev - curr
        case "x": result = prev * curr
        case "/": result = curr == 0 ? 0 : prev / curr
        default: break
        }
        
        display = format(result)
        previousValue = nil
        currentOperator = nil
        isTypingNumber = false
    }
    
    
    //  PERCENT
    func percent() {
        if let prev = previousValue,
           let curr = Double(display) {
            display = format(prev * (curr / 100))
        } else if let curr = Double(display) {
            display = format(curr / 100)
        }
    }
    
    
    //  +/-
    func toggleSign() {
        if let value = Double(display) {
            display = format(value * -1)
        }
    }
    
    
    //  AC
    func clear() {
        display = "0"
        previousValue = nil
        currentOperator = nil
        isTypingNumber = false
    }
    
    
    //  NÚMEROS
    func inputNumber(_ n: String) {
        if isTypingNumber {
            if display.count < 9 {  // limite opcional
                display += n
            }
        } else {
            display = n
            isTypingNumber = true
        }
    }
    
    
    //  VÍRGULA
    func addDecimalPoint() {
        if !display.contains(".") {
            display += "."
            isTypingNumber = true
        }
    }
    
    //  BACKSPACE
    func deleteLastDigit() {
        guard isTypingNumber else { return }
        
        if display.count > 1 {
            display.removeLast()
        } else {
            display = "0"
            isTypingNumber = false
        }
    }
}

