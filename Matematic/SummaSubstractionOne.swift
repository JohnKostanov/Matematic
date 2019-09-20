//
//  SummaSubstractionOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 20/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaSubstractionOne: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .ten).generateRandomInt()
    }
    
    var all: [Question] {
        return [
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy),
            Question(numberFirst: randomInt, numberSecond: randomInt, questionType: .summaSubstraction, questionLevel: .easy)
        ]
    }
    
    
}
