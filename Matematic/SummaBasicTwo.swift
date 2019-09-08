//
//  SummaBasicTwo.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SummaBasicTwo: SummaBasicOne {
    
    override var randomBasic: Int {
        return super.randomBasic + 10
    }
    
    override var all: [Question] {
        return super.all
        
    }
}
