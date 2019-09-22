//
//  DivisionBasicTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 22/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class DivisionBasicTwo: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .twenty).generateRandomInt()
    }
    var randomIntTen: Int {
        return  NumberRandomFactory.produceRandomInt(type: .ten).generateRandomInt()
    }
    
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomIntTen, questionType: .division, questionLevel: .normal)
        ]
    }
    
    
}
