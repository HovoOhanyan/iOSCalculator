//
//  File.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 08.08.23.
//

import Foundation

extension Double {
    static func +(lhs: Double, rhs: Int) -> Double {
        return lhs + Double(rhs)
    }
    
    static func +(lhs: Int, rhs: Double) -> Double {
        return Double(lhs) + rhs
    }
}
