//
//  SummaSubstractionTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 20/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaSubstractionTwo: QuestionProtocol {
    
    var randomInt: Int {
        return  NumberRandomFactory.produceRandomInt(type: .twenty).generateRandomInt()
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
