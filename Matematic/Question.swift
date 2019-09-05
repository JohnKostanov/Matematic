//
//  Question.swift
//  Matematic
//
//  Created by  Джон Костанов on 02/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

struct Question {
    var numberFirst: Int
    var numberSecond: Int
    var questionText: String {
        get {
            return "\(numberFirst) + \(numberSecond)"
        }
    }
    var answer: String  {
        get {
            return "\(numberFirst + numberSecond)"
        }
    }

    
}

extension Question {
    static var all: [Question] {
        return [
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            Question(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1))
        
        ]
    }
}
