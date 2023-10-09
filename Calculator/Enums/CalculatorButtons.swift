//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 05.08.23.
//

import Foundation
import UIKit

//MARK: - Button definitions

enum CalculatorButton {
    case ac
    case plusMinus
    case percent
    case divison
    case multiple
    case minus
    case plus
    case number(Int)
    case equal
    case dot
    
    init(calculatorButton: CalculatorButton) {
        switch calculatorButton {
            
        case .ac, .plusMinus, .percent, .divison, .multiple, .minus, .plus, .equal, .dot:
            self = calculatorButton
        case .number(let int):
            if int.description.count == 1 {
                self = calculatorButton
            } else {
                fatalError()
            }
        }
    }
}

extension CalculatorButton {
    var title: String {
        switch self {
        case .ac:
            return "AC"
        case .plusMinus:
            return "+/-"
        case .percent:
            return "%"
        case .divison:
            return "/"
        case .multiple:
            return "x"
        case .minus:
            return "-"
        case .plus:
            return "+"
        case .number(let int):
            return int.description
        case .equal:
            return "="
        case .dot:
            return "."
        }
    }
    
    var color: UIColor {
        switch self {
        case .ac, .plusMinus, .percent:
            return .lightGray
        case .divison, .multiple, .minus, .plus, .equal:
            return .systemOrange
        case .number, .dot:
            return .darkGray
        }
    }
    
    var selectedColor: UIColor? {
        switch self {
        case .ac, .plusMinus, .percent, .number, .dot, .equal:
            return nil
        case .divison, .multiple, .minus, .plus:
            return .white
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .ac, .plusMinus, .percent:
            return .black
        default:
            return .white
        }
    }
}
