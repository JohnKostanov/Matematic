//
//  SummaBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicOne: SummaBasic {
    var randomBasicOne = NumberRandomFactory.produceRandomInt(type: .ten)
    var all: [Question] {
        return [
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa),
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .summa)
        ]
    }
    
    
}
