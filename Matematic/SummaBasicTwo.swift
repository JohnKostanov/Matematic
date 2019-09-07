//
//  SummaBasicTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicTwo: SummaBasic {
    var all: [Question] {
        return [
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa),
            Question(numberFirst: Int(arc4random_uniform(10) + 11), numberSecond: Int(arc4random_uniform(10) + 11), questionType: .summa)
            
        ]
        
    }
}
