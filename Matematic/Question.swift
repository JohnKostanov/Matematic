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
    var numberFirst: Int {
        get {
            let random = Int(arc4random_uniform(10))
            return random
        }
    }
    var numberSecond: Int {
        get {
            let random = Int(arc4random_uniform(10))
            return random
        }
    }
    
    var numberThird: Int
    var operatorType: OperatorType
    
}

    

    
    


extension Question {
    static var all: [Question] {
        return [
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa),
        Question(questionType: "Сложите",  numberThird: 0, operatorType: .summa)
        ]
    }
}
