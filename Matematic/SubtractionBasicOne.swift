//
//  SubtractionBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicOne: SummaBasicOne {

    override var all: [Question] {
        return [
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction),
            Question(numberFirst: randomBasic, numberSecond: randomBasic, questionType: .substraction)
            
        ]
    }
    
    
}
