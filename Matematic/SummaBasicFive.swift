//
//  SummaBasicFive.swift
//  Matematic
//
//  Created by  Джон Костанов on 16/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicFive: SummaBasicOne {
    override var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .fifty).generateRandomInt()
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
