//
//  SummaBasicTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicTwo: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .twenty).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .normal)
        ]
    }
}
