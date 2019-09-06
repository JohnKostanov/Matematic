//
//  SubtractionBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicOne: SubtractionBasic {
    var all: [SubtractionQuestion] {
        return [
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            SubtractionQuestion(numberFirst: Int(arc4random_uniform(10) + 1), numberSecond: Int(arc4random_uniform(10) + 1)),
            
        ]
    }
    
    
}
