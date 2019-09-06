//
//  SummaBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicOne: SummaBasic {
    var all: [Question] {
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
