//
//  SummaSubstractionThree.swift
//  Matematic
//
//  Created by  Джон Костанов on 20/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaSubstractionThree: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .thirty).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .medium)
        ]
    }
    
    
}
