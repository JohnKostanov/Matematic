//
//  SubtractionBasicThree.swift
//  Matematic
//
//  Created by  Джон Костанов on 16/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicThree: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .thirty).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .medium)
            
        ]
    }
}
