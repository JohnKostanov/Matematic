//
//  MultiplicationBasicFive.swift
//  Matematic
//
//  Created by  Джон Костанов on 22/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class MultiplicationBasicFive: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .fifty).generateRandomInt()
    }
    var randomIntTen: Int {
        return  NumberRandomFactory.produceRandomInt(type: .ten).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .multiplication, questionLevel: .highHard)
        ]
    }
    
    
}
