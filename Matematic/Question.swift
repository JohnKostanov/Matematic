//
//  Question.swift
//  Matematic
//
//  Created by  Джон Костанов on 02/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

struct Question {
    var numberFirst: Int
    var numberSecond: Int
    var questionType: QuestionType
    var questionLevel: QuestionLevel
}

extension Question {
    
    var questionText: String {
        switch questionType {
        case .summa:
            return "\(numberFirst) + \(numberSecond) = ?"
        case .substraction:
            return "\(numberFirst) - \(numberSecond) = ?"
        case .summaSubstraction:
            return "\(numberSecond * 2) + \(numberFirst) - \(numberSecond) = ?"
        case .multiplication:
            return "\(numberFirst) × \(numberSecond) = ?"
        }
    }
    
    var answer: String {
        switch questionType {
        case .summa:
            return "\(numberFirst + numberSecond)"
        case .substraction:
            return "\(numberFirst - numberSecond)"
        case .summaSubstraction:
            return "\((numberSecond * 2) + numberFirst - numberSecond)"
        case .multiplication:
            return "\(numberFirst * numberSecond)"
        }
    }
}
