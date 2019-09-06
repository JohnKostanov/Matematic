//
//  SubtractionBasicOne.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicOne: SubtractionBasic {
    var randomBasicOne = NumberRandomFactory.produceRandomInt(type: .ten)
    var all: [SubtractionQuestion] {
        return [
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt()),
            SubtractionQuestion(numberFirst: randomBasicOne.generateRandomInt(), numberSecond: randomBasicOne.generateRandomInt())
            
        ]
    }
    
    
}
