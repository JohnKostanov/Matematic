//
//  Question.swift
//  Matematic
//
//  Created by  Джон Костанов on 02/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

struct Question {
    var questionType: String
    var numberFirst: Int
    var numberSecond: Int
    var numberThird: Int
    var operatorType: OperatorType
    
}

extension Question {
    var currentAnswer: String {
        return "\(numberFirst + numberSecond)"
    }
    
}

extension Question {
    static var all: [Question] {
        return [
        Question(questionType: "Сложите", numberFirst: 2, numberSecond: 2, numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите", numberFirst: 3, numberSecond: 5, numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите", numberFirst: 4, numberSecond: 7, numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите", numberFirst: 6, numberSecond: 9, numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите", numberFirst: 8, numberSecond: 9, numberThird: 0, operatorType: .summa)
        ]
    }
}
