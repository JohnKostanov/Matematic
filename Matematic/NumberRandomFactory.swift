//
//  NumberRandomFactory.swift
//  Matematic
//
//  Created by  Джон Костанов on 07/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class NumberRandomFactory {
    fileprivate struct NumberRandom10: RandomInt {
        func generateRandomInt() -> Int {
            return Int(arc4random_uniform(10) + 1)
        }
    }
    fileprivate struct NumberRandom20: RandomInt {
        func generateRandomInt() -> Int {
            return Int(arc4random_uniform(10) + 10)
        }
    }
    fileprivate struct NumberRandom30: RandomInt {
        func generateRandomInt() -> Int {
            return Int(arc4random_uniform(10) + 20)
        }
    }
    
    fileprivate struct NumberRandom40: RandomInt {
        func generateRandomInt() -> Int {
            return Int(arc4random_uniform(10) + 30)
        }
    }
    fileprivate struct NumberRandom50: RandomInt {
        func generateRandomInt() -> Int {
            return Int(arc4random_uniform(10) + 40)
        }
    }
    
    enum RandomType {
        case ten, twenty, thirty, forty, fifty
        
    }
    
    static func produceRandomInt(type: RandomType) -> RandomInt {
        var randomInt: RandomInt
        
        switch type {
        case .ten: randomInt = NumberRandom10()
        case .twenty: randomInt = NumberRandom20()
        case .thirty: randomInt = NumberRandom30()
        case .forty: randomInt = NumberRandom40()
        case .fifty: randomInt = NumberRandom50()
        }
        
        return randomInt
    }
}


protocol RandomInt {
    func generateRandomInt() -> Int
}
