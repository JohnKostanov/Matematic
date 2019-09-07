//
//  SubtractionBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicOne: QuestionProtocol {
    var randomBasicOne = NumberRandomFactory.produceRandomInt(type: .ten)
    var all: [Question] {
        return [
            Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction),
             Question(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt(), questionType: .substraction)
            
        ]
    }
    
    
}
