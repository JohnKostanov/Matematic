//
//  SummaQuestion.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation


class SummaQuestion {
    private var summaBasic: Questions!
    
    func performSummaBasic() -> [Question] {
        return summaBasic!.all
    }
    
    func setSummaBasicType(summaBasic: Questions) {
        self.summaBasic = summaBasic
    }
    
    init(summaBasic: Questions) {
        self.summaBasic = summaBasic
    }
}
