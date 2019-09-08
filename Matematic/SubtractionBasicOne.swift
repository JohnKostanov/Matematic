//
//  SubtractionBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicOne: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .ten).generateRandomInt()
    }

    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .easy)
            
        ]
    }
}
