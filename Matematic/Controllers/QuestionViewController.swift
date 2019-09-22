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
    @IBOutlet var correctAnswerView: UIView!
    
    @IBOutlet var nextQuestionButton: UIButton!
    
    @IBOutlet var errorAnswerStackView: UIStackView!
    @IBOutlet var errorAnswerView: UIView!
    
    @IBOutlet var correctAnswerLabel: UILabel!
    @IBOutlet var nextQuestionButtonError: UIButton!
    
    @IBOutlet var restoreLifeStackView: UIStackView!
    @IBOutlet var restoreLifeView: UIView!
    
    @IBOutlet var exchangeOneDiamondButton: UIButton!
    @IBOutlet var exchangeThreeDiamondButton: UIButton!
    @IBOutlet var completeLessonButton: UIButton!
    
    
    // MARK: - Properties
    
    var answer: String = ""
    var questionIndex = 0
    var currentDiamond = 0
    var currentHeart = 5
    var createQuestion = CreateQuestion(questionBasic: SummaBasicOne())
    var questions: [Question]!
    var questionType = QuestionType.summa
    var questionLevel = QuestionLevel.easy
    
    var isEnabledButtons = true
    
    
    var correctAnswer = 0
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createQuestion.performQuestions()
        performCofigurateOutlets()
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        verifyButton.backgroundColor = #colorLiteral(red: 1, green: 0.4941176471, blue: 0.3098039216, alpha: 1)
        
        hideAllStackView()
        nextQuestionButton.layer.cornerRadius = 15
        nextQuestionButtonError.layer.cornerRadius = 15
        exchangeOneDiamondButton.layer.cornerRadius = 15
        exchangeThreeDiamondButton.layer.cornerRadius = 15
        completeLessonButton.layer.cornerRadius = 15
        
    }
    
    func hideAllStackView() {
        correctAnswerStackView.isHidden = true
        errorAnswerStackView.isHidden = true
        restoreLifeStackView.isHidden = true
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
    
    func clearNumbersInputLabel() {
        numbersInputLabel.text = ""
        updateVerifyButton()
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
    
    func changeStateButtons() {
        if isEnabledButtons {
            for button in numbersButtons {
                button.isEnabled = false
            }
            minusButton.isEnabled = false
            deleteButton.isEnabled = false
            isEnabledButtons.toggle()
        } else {
            for button in numbersButtons {
                button.isEnabled = true
            }
            minusButton.isEnabled = true
            deleteButton.isEnabled = true
            isEnabledButtons.toggle()
        }
    }
    
    func addAnimateViewOpening(view: UIView, stackView: UIStackView, hideStack: UIStackView?) {
        view.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.2, delay: 0.2, animations: {
            stackView.isHidden = false
            view.transform = .identity
        }) { _ in
            hideStack?.isHidden = true
        }
    }
    
    func addAnimateViewClosing(view: UIView, stackView: UIStackView) {
        UIView.animate(withDuration: 0.2, delay: 0.2, animations: {
            view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }) { _ in
            stackView.isHidden = false
            self.updateUI()
        }
    }
    
    func addAnimateButton(sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            sender.setTitleColor(.orange, for: .normal)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: [], animations: {
                sender.transform = CGAffineTransform.identity
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.4941176471, blue: 0.3098039216, alpha: 1)
                sender.setTitleColor(.white, for: .normal)
            })
        }
    }
    
    
    
    func updateCorrectAndErrorStackView() {
        let endIndex = questionLabel.text!.index(before: questionLabel.text!.endIndex)
        questionLabel.text!.remove(at: endIndex)
        if numbersInputLabel.text == answer {
            addAnimateViewOpening(view: correctAnswerView, stackView: correctAnswerStackView, hideStack: nil)
            correctAnswer += 1
            
        } else {
            addAnimateViewOpening(view: errorAnswerView, stackView: errorAnswerStackView, hideStack: nil)
            
            currentHeart -= 1
            currentHeartLabel.text = "❤️ \(currentHeart)"
            correctAnswerLabel.text = "\(questionLabel.text!) \(answer)"
        }
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
                createQuestion.setQuestionBasicType(questionBasicType: SummaBasicThree())
                performTextQuestionAndAnswer()
            case .hard:
                createQuestion.setQuestionBasicType(questionBasicType: SummaBasicFour())
                performTextQuestionAndAnswer()
            case .highHard:
                createQuestion.setQuestionBasicType(questionBasicType: SummaBasicFive())
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
                createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicThree())
                performTextQuestionAndAnswer()
            case .hard:
                createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicFour())
                performTextQuestionAndAnswer()
            case .highHard:
                createQuestion.setQuestionBasicType(questionBasicType: SubtractionBasicFive())
                performTextQuestionAndAnswer()
            }
        case .summaSubstraction:
            switch questionLevel {
            case .easy:
                createQuestion.setQuestionBasicType(questionBasicType: SummaSubstractionOne())
                performTextQuestionAndAnswer()
            case .normal:
                createQuestion.setQuestionBasicType(questionBasicType: SummaSubstractionOne())
                performTextQuestionAndAnswer()
            case .medium:
                createQuestion.setQuestionBasicType(questionBasicType: SummaSubstractionOne())
                performTextQuestionAndAnswer()
            case .hard:
                createQuestion.setQuestionBasicType(questionBasicType: SummaSubstractionOne())
                performTextQuestionAndAnswer()
            case .highHard:
                createQuestion.setQuestionBasicType(questionBasicType: SummaSubstractionOne())
                performTextQuestionAndAnswer()
            }
        }
    }
    
    func updateUI() {
        
        guard questionIndex < questions.count else {
            nextQuestion()
            return
        }
        
        performQuestions()
        hideAllStackView()
        updateProgress()
        updateDiamondAndHeart()
        nextQuestion()
    }
    
    // MARK: - Actions
    @IBAction func numbersAnswer(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowAnimatedContent], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
                sender.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                sender.setTitleColor(#colorLiteral(red: 0, green: 0.459597826, blue: 1, alpha: 1), for: .normal)

            }
        }
        guard let numbersText = sender.titleLabel?.text else { return }
        if numbersInputLabel.text!.count < 12 && numbersInputLabel.text! != "0" && numbersInputLabel.text! != "-0" {
            numbersInputLabel.text! += numbersText
            updateVerifyButton()
        } else if numbersInputLabel.text! == "0" || numbersInputLabel.text! == "-0" {
            numbersInputLabel.text! = numbersText
            updateVerifyButton()
        }
    }
    
    @IBAction func deleteTextAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowAnimatedContent], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
                sender.setTitleColor(#colorLiteral(red: 0, green: 0.459597826, blue: 1, alpha: 1), for: .normal)
                
            }
        }
        clearNumbersInputLabel()
    }
    
    @IBAction func addNegativeNumbers(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowAnimatedContent], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
                sender.backgroundColor = #colorLiteral(red: 0, green: 0.9490196078, blue: 1, alpha: 1)
                sender.setTitleColor(#colorLiteral(red: 0, green: 0.459597826, blue: 1, alpha: 1), for: .normal)
                
            }
        }
        numbersInputLabel.text = sender.titleLabel?.text
        updateVerifyButton()
    }
    
    
    @IBAction func examinationButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowAnimatedContent], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = CGAffineTransform.identity
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.4941176471, blue: 0.3098039216, alpha: 1)
                sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            }
        }
        updateCorrectAndErrorStackView()
        changeStateButtons()
    }
    
    @IBAction func nextQuestionAction(_ sender: UIButton) {
        if currentHeart < 1 {
            addAnimateButton(sender: sender)
            addAnimateViewOpening(view: restoreLifeView, stackView: restoreLifeStackView, hideStack: errorAnswerStackView)
            
        } else {
            addAnimateButton(sender: sender)
            if correctAnswerStackView.isHidden {
                addAnimateViewClosing(view: errorAnswerView, stackView: errorAnswerStackView)
            } else {
                addAnimateViewClosing(view: correctAnswerView, stackView: correctAnswerStackView)
            }
            clearNumbersInputLabel()
            changeStateButtons()
        }
        
        
    }
    
    @IBAction func exchangeOneDiamond(_ sender: UIButton) {
        if currentDiamond >= 1 {
            currentHeart += 1
            currentDiamond -= 1
            clearNumbersInputLabel()
            addAnimateButton(sender: sender)
            addAnimateViewClosing(view: restoreLifeView, stackView: restoreLifeStackView)
        } else {
            //            ToDo встроенные покупки
        }
        changeStateButtons()
    }
    
    @IBAction func exchangeThreeDiamond(_ sender: UIButton) {
        if currentDiamond >= 3 {
            currentHeart = 5
            currentDiamond -= 3
            clearNumbersInputLabel()
            addAnimateButton(sender: sender)
            addAnimateViewClosing(view: restoreLifeView, stackView: restoreLifeStackView)
        } else {
            //            ToDo встроенные покупки
        }
        changeStateButtons()
    }
    
    @IBAction func completeLesson(_ sender: UIButton) {
        addAnimateButton(sender: sender)
//        updateUI()
        performSegue(withIdentifier: "ResultSegue", sender: nil)
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
