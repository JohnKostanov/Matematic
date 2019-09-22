//
//  SubtractionBasicTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 08/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicTwo: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .twenty).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .substraction, questionLevel: .normal)
            
        ]
    }
}
