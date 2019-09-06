//
//  SubtractionBasicQuestion.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

class SubtractionBasicQuestion {
    private var subtractionBasic: SubtractionBasic!
    
    func performSummaBasic() -> [SubtractionQuestion] {
        return subtractionBasic!.all
    }
    
    func setSummaBasic(type: SubtractionBasic) {
        self.subtractionBasic = type
    }
    
    init(subtractionBasic: SubtractionBasic) {
        self.subtractionBasic = subtractionBasic
    }
}
