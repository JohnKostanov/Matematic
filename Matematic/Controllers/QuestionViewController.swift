//
//  QuestionViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 08/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var summaBasicStackView: UIStackView!
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    //MARK: - Properties
    var questionIndex = 0
    var question: [Question]!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        question = Question.all
    }
    

  
    @IBAction func buttonAction(_ sender: UIButton) {
       updateUI()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
    }
    func updateUI() {
        questionLabel.text = question[questionIndex].questionType + " " + String(question[questionIndex].numberFirst) + " " + "+" + " " + String(question[questionIndex].numberSecond)
        answerLabel.text = "Правильный ответ: " + question[questionIndex].currentAnswer
        nextQuestion()
    }

}
