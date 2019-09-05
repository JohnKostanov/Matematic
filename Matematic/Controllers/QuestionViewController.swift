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
    @IBOutlet var numbersInputLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var numbersButtons: [UIButton]!
    
    
    //MARK: - Properties
    var questionIndex = 0
    var question: [Question]!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        question = Question.all
        updateUI()
    }
    
    
    
    func nextQuestion() {
        questionIndex += 1
    }
    
    func updateUI() {
        questionLabel.text = question[questionIndex].questionText
        answerLabel.text = question[questionIndex].answer
  
        nextQuestion()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        updateUI()
        numbersInputLabel.text! = ""
    }
    
    @IBAction func numbersAnswer(_ sender: UIButton) {
        guard let numbersText = sender.titleLabel?.text else { return }
//        guard var answerLabel = answerLabel.text else { return }
//        numbersInputLabel.text! = ""
        numbersInputLabel.text! += numbersText
        print(numbersText)
    }
    
    @IBAction func examinationButtonPressed(_ sender: UIButton) {
        if numbersInputLabel.text == answerLabel.text {
            let alertController = UIAlertController(title: "Правильно", message: "Продолжить", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Не правильно", message: "Продолжить", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true)
            
        }
    }
    
}
