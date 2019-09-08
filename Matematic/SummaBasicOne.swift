//
//  SummaBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicOne: QuestionProtocol {
    
    var randomBasic: Int {
        let random = NumberRandomFactory.produceRandomInt(type: .ten)
        return random.generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .summa)
        ]
    }
    
    
}
