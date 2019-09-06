//
//  SummaQuestion.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation


class SummaQuestion {
    private var summaBasic: SummaBasic!
    
    func performSummaBasic() -> [Question] {
        return summaBasic!.all
    }
    
    func setSummaBasicType(summaBasic: SummaBasic) {
        self.summaBasic = summaBasic
    }
    
    init(summaBasic: SummaBasic) {
        self.summaBasic = summaBasic
    }
}
