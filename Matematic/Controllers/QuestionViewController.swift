//
//  QuestionViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 08/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var summaBasicStackView: UIStackView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var numbersInputLabel: UILabel!
    @IBOutlet var numbersButtons: [UIButton]!
    
    @IBOutlet var progressView: UIProgressView!
    
    // MARK: - Properties
    var createQuestion = CreateQuestion(questionBasic: SummaBasicOne())
    
    var answer: String = ""
    var questionIndex = 0
    var questions: [Question]!
    var isQuestionSumma = true
    
    var questionType = QuestionType.summa
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createQuestion.performQuestions()
        updateUI()
    }
    
    // MARK: - Custom Methods
    func nextQuestion() {
        if questionIndex < questions.count {
           questionIndex += 1
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    func updateProgress() {
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        let progress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(progress, animated: true)
    }
    
    func updateUI() {
        
        guard questionIndex < questions.count else {
            nextQuestion()
            return
        }
        
        switch questionType {
        case .summa:
            questionLabel.text = questions[questionIndex].questionText
            answer = String(questions[questionIndex].answer)
        case .substraction:
            createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicOne())
            questions = createQuestion.performQuestions()
            questionLabel.text = questions[questionIndex].questionText
            answer = String(questions[questionIndex].answer)
        }
        
        updateProgress()
  
        nextQuestion()
    }
    
    // MARK: - Actions
    @IBAction func numbersAnswer(_ sender: UIButton) {
        guard let numbersText = sender.titleLabel?.text else { return }
        numbersInputLabel.text! += numbersText
    }
    
    @IBAction func deleteTextAction(_ sender: UIButton) {
        numbersInputLabel.text = ""
    }
    
    @IBAction func addNegativeNumbers(_ sender: UIButton) {
        numbersInputLabel.text = sender.titleLabel?.text
    }
    
    
    @IBAction func examinationButtonPressed(_ sender: UIButton) {
        if numbersInputLabel.text == answer {
            let alertController = UIAlertController(title: "Верно", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { _ in
                self.updateUI()
                self.numbersInputLabel.text! = ""
            }))
            self.present(alertController, animated: true, completion: nil)
          
            
        } else {
            let alertController = UIAlertController(title: "Правильный ответ", message: answer, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { _ in
                self.updateUI()
                self.numbersInputLabel.text! = ""
            }))
            self.present(alertController, animated: true)
            
        }
    }
    
}
