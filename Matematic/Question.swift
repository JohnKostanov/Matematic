//
//  Question.swift
//  Matematic
//
//  Created by  Джон Костанов on 02/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

struct Question {
    var questionType: QuestionType
    var questionLevel: QuestionLevel
}

extension Question {
    var numberFirst: Int {
        switch questionLevel {
        case .easy:
            let random = NumberRandomFactory.produceRandomInt(type: .ten)
            return random.generateRandomInt()
        case .normal:
            let random = NumberRandomFactory.produceRandomInt(type: .twenty)
            return random.generateRandomInt()
        case .medium:
            let random = NumberRandomFactory.produceRandomInt(type: .thirty)
            return random.generateRandomInt()
        case .hard:
            let random = NumberRandomFactory.produceRandomInt(type: .forty)
            return random.generateRandomInt()
        case .highHard:
            let random = NumberRandomFactory.produceRandomInt(type: .fifty)
            return random.generateRandomInt()
        }
    }
    var numberSecond: Int {
        switch questionLevel {
        case .easy:
            let random = NumberRandomFactory.produceRandomInt(type: .ten)
            return random.generateRandomInt()
        case .normal:
            let random = NumberRandomFactory.produceRandomInt(type: .twenty)
            return random.generateRandomInt()
        case .medium:
            let random = NumberRandomFactory.produceRandomInt(type: .thirty)
            return random.generateRandomInt()
        case .hard:
            let random = NumberRandomFactory.produceRandomInt(type: .forty)
            return random.generateRandomInt()
        case .highHard:
            let random = NumberRandomFactory.produceRandomInt(type: .fifty)
            return random.generateRandomInt()
        }
    }
    
    var questionText: String {
        switch questionType {
        case .summa:
            return "\(numberFirst) + \(numberSecond)"
        case .substraction:
            return "\(numberFirst) - \(numberSecond)"
        }
    }
    
    var answer: String {
        switch questionType {
        case .summa:
            return "\(numberFirst + numberSecond)"
        case .substraction:
            return "\(numberFirst - numberSecond)"
        }
    }
}
