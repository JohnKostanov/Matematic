//
//  SummaBasicTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicTwo: SummaBasicOne {
    
    override var randomInt: Int {
        return super.randomInt + 10
    }
    
    override var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summa, questionLevel: .easy)
        ]
    }
}
