//
//  MultiplicationBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 22/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class MultiplicationBasicOne: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .ten).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .multiplication, questionLevel: .easy)
        ]
    }
    
    
}
