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
    @IBOutlet var questionStackView: UIStackView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var numbersInputLabel: UILabel!
    @IBOutlet var numbersButtons: [UIButton]!
    
    @IBOutlet var progressView: UIProgressView!
    
    // MARK: - Properties
    
    var answer: String = ""
    var questionIndex = 0
    var createQuestion = CreateQuestion(questionBasic: SummaBasicOne())
    var questions: [Question]!
    var questionType = QuestionType.summa
    var questionLevel = QuestionLevel.easy
    
    
    var correctAnswer = 0
    var summaBasicPoints = 0
    
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
    
    func performTextQuestionAndAnswer() {
        questions = createQuestion.performQuestions()
        questionLabel.text = questions[questionIndex].questionText
        answer = String(questions[questionIndex].answer)
    }
    
    func updateUI() {
        
        guard questionIndex < questions.count else {
            nextQuestion()
            return
        }
        
        switch questionType {
        case .summa:
            switch summaBasicPoints {
            case 0...30:
                questionLevel = .easy
            case 30...60:
                questionLevel = .normal
            default:
                questionLevel = .highHard
            }
    
            switch questionLevel {
            case .easy:
                performTextQuestionAndAnswer()
            case .normal:
                createQuestion.setQuestionBasicType(questionBasicType: SummaBasicTwo())
                performTextQuestionAndAnswer()
            case .medium:
                performTextQuestionAndAnswer()
            case .hard:
                performTextQuestionAndAnswer()
            case .highHard:
                performTextQuestionAndAnswer()
            }
        case .substraction:
            createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicOne())
            switch questionLevel {
            case .easy:
                performTextQuestionAndAnswer()
            case .normal:
                createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicTwo())
                performTextQuestionAndAnswer()
            case .medium:
                performTextQuestionAndAnswer()
            case .hard:
                performTextQuestionAndAnswer()
            case .highHard:
                performTextQuestionAndAnswer()
            }
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
            let alertController = UIAlertController(title: "Верно", message: nil, preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { _ in
                self.updateUI()
                self.numbersInputLabel.text! = ""
            }))
            self.present(alertController, animated: true, completion: nil)
            
            correctAnswer += 1
            summaBasicPoints += 4
            print(summaBasicPoints)
          
            
        } else {
            let alertController = UIAlertController(title: "Правильный ответ", message: answer, preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { _ in
                self.updateUI()
                self.numbersInputLabel.text! = ""
            }))
            self.present(alertController, animated: true)
            
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultSegue" else { return }
        let destination = segue.destination as! ResultViewController
        destination.correctAnswer = correctAnswer
        
    }
    
}
