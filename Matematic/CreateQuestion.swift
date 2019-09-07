//
//  CreateQuestion.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation


class CreateQuestion {
    private var questionBasic: QuestionProtocol!
    
    func performQuestions() -> [Question] {
        return questionBasic!.all
    }
    
    func setQuestionBasicType(questionBasicType: QuestionProtocol) {
        self.questionBasic = questionBasicType
    }
    
    init(questionBasic: QuestionProtocol) {
        self.questionBasic = questionBasic
    }
}
