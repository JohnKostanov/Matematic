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
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var currentDiamondLabel: UILabel!
    @IBOutlet var currentHeartLabel: UILabel!
    
    @IBOutlet var questionStackView: UIStackView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var numbersInputLabel: UILabel!
    @IBOutlet var numbersButtons: [UIButton]!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var verifyButton: UIButton!
    
    
    @IBOutlet var correctAnswerStackView: UIStackView!
    @IBOutlet var nextQuestionButton: UIButton!
    
    @IBOutlet var errorAnswerStackView: UIStackView!
    @IBOutlet var correctAnswerLabel: UILabel!
    @IBOutlet var nextQuestionButtonError: UIButton!
    
    
    // MARK: - Properties
    
    var answer: String = ""
    var questionIndex = 0
    var currentDiamond = 0
    var currentHeart = 5
    var createQuestion = CreateQuestion(questionBasic: SummaBasicOne())
    var questions: [Question]!
    var questionType = QuestionType.summa
    var questionLevel = QuestionLevel.easy
    
    
    var correctAnswer = 0
    var summaBasicPoints = 0
    var substractionBasicPoints = 0
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createQuestion.performQuestions()
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        performCofigurateOutlets()
        updateVerifyButton()
    }
    
    // MARK: - Custom Methods
    func performCofigurateOutlets() {
        for button in numbersButtons {
            button.layer.cornerRadius = 15
            button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
        minusButton.layer.cornerRadius = 15
        minusButton.backgroundColor = #colorLiteral(red: 0, green: 0.9490196078, blue: 1, alpha: 1)
        deleteButton.layer.cornerRadius = 15
        deleteButton.backgroundColor = #colorLiteral(red: 1, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
        verifyButton.layer.cornerRadius = 15
        verifyButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        correctAnswerStackView.isHidden = true
        errorAnswerStackView.isHidden = true
        nextQuestionButton.layer.cornerRadius = 15
        nextQuestionButtonError.layer.cornerRadius = 15
    }
    
    func updateVerifyButton() {
        if numbersInputLabel.text == "" || numbersInputLabel.text == "-" {
            verifyButton.isEnabled = false
            verifyButton.alpha = 0.5
        } else {
            verifyButton.isEnabled = true
            verifyButton.alpha = 1
        }
    }
    
    func nextQuestion() {
        if questionIndex < questions.count  {
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
    
    func updateDiamondAndHeart() {
        currentDiamondLabel.text = "💎 \(currentDiamond)"
        currentHeartLabel.text = "❤️ \(currentHeart)"
    }
    
    func performTextQuestionAndAnswer() {
        questions = createQuestion.performQuestions()
        questionLabel.text = questions[questionIndex].questionText
        answer = String(questions[questionIndex].answer)
    }
    
    
    func performQuestions() {
        switch questionType {
        case .summa:
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
            switch questionLevel {
            case .easy:
                createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicOne())
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
    }
    
    func updateUI() {
        
        if currentHeart < 1 && currentDiamond >= 1 {
            let alertController = UIAlertController(title: "У вас нет жизней!", message: "Чтобы продолжить, восстановите свои жизни.", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Обменять 💎 на ❤️", style: .default, handler: { _ in
                self.currentHeart += 1
                self.currentDiamond -= 1
                self.updateDiamondAndHeart()
            }))
            self.present(alertController, animated: true)
            
        }
        
        if currentHeart < 1 && currentDiamond < 1 {
            let alertController = UIAlertController(title: "У вас нет жизней!", message: "Завершить урок", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
               self.performSegue(withIdentifier: "ResultSegue", sender: nil)
            }))
            self.present(alertController, animated: true)
            
        }
        
        if currentDiamond < 1 {
//            ToDo встроенные покупки
        }
        
        guard questionIndex < questions.count else {
            nextQuestion()
            return
        }
        
        performQuestions()
        updateProgress()
        updateDiamondAndHeart()
        nextQuestion()
    }
    
    // MARK: - Actions
    @IBAction func numbersAnswer(_ sender: UIButton) {
        guard let numbersText = sender.titleLabel?.text else { return }
        numbersInputLabel.text! += numbersText
        updateVerifyButton()
    }
    
    @IBAction func deleteTextAction(_ sender: UIButton) {
        numbersInputLabel.text = ""
        updateVerifyButton()
    }
    
    @IBAction func addNegativeNumbers(_ sender: UIButton) {
        numbersInputLabel.text = sender.titleLabel?.text
        updateVerifyButton()
    }
    
    
    @IBAction func examinationButtonPressed(_ sender: UIButton) {
        if numbersInputLabel.text == answer {
            correctAnswerStackView.isHidden = false
            correctAnswer += 1
            
        } else {
            errorAnswerStackView.isHidden = false
            currentHeart -= 1
            currentHeartLabel.text = "❤️ \(currentHeart)"
            correctAnswerLabel.text = "Правильный ответ: \(questionLabel.text!) \(answer)"
        }
    }
    
    @IBAction func nextQuestionAction(_ sender: UIButton) {
        numbersInputLabel.text! = ""
        updateVerifyButton()
        
        correctAnswerStackView.isHidden = true
        errorAnswerStackView.isHidden = true
        
        updateUI()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultSegue" else { return }
        let destination = segue.destination as! ResultViewController
        destination.correctAnswer = correctAnswer
        destination.currentDiamond = currentDiamond
        destination.currentHeart = currentHeart
    }
    
}
