//
//  MainViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var currentExperianceLabel: UILabel!
    @IBOutlet var goalExperianceLabel: UILabel!
    @IBOutlet var currentProgressView: UIProgressView!
    @IBOutlet var levelLabel: UILabel!
    
    @IBOutlet var currentDimondLabel: UILabel!
    @IBOutlet var currentHeartLabel: UILabel!
    
    @IBOutlet var summaBasicButton: UIButton!
    
    @IBOutlet var summaBasicStackView: UIStackView!
    @IBOutlet var summaBasicView: UIView!
    @IBOutlet var summaBasicLevelLabel: UILabel!
    @IBOutlet var summaBasicPointsLabel: UILabel!
    @IBOutlet var summaBasicButtonStart: UIButton!
    
    @IBOutlet var subtractionBasicButton: UIButton!
    
    @IBOutlet var substractionBasicStackView: UIStackView!
    @IBOutlet var substractionBasicView: UIView!
    @IBOutlet var substractionBasicLevelLabel: UILabel!
    @IBOutlet var substractionBasicPointsLabel: UILabel!
    @IBOutlet var substractionBasicButtonStart: UIButton!
    
    @IBOutlet var summaSubstractionButton: UIButton!
    
    @IBOutlet var summaSubstractionStackView: UIStackView!
    @IBOutlet var summaSubstractionView: UIView!
    @IBOutlet var summaSubstractionLevelLabel: UILabel!
    @IBOutlet var summaSubstractionPointsLabel: UILabel!
    @IBOutlet var summaSubstractionButtonStart: UIButton!
    
    @IBOutlet var multiplicationBasicButtton: UIButton!
    
    @IBOutlet var multiplicationBasicStackView: UIStackView!
    
    
    @IBOutlet var divisionBasicButton: UIButton!
    
    @IBOutlet var divisionBasicStackView: UIStackView!
    
    
    // MARK: - Properties
    var isSummaBasicStackViewShown: Bool = false {
        didSet {
            summaBasicStackView.isHidden = !isSummaBasicStackViewShown
        }
    }
    var isSubstractionBasicStackViewShown: Bool = false {
        didSet {
            substractionBasicStackView.isHidden = !isSubstractionBasicStackViewShown
        }
    }
    
    var isSummaSubstractionStackViewShown: Bool = false {
        didSet {
            summaSubstractionStackView.isHidden = !isSummaSubstractionStackViewShown
        }
    }
    
    var isMultiplicationBasicStackViewShown: Bool = false {
        didSet {
            multiplicationBasicStackView.isHidden = !isMultiplicationBasicStackViewShown
        }
    }
    
    var isDivisionBasicStackViewShown: Bool = false {
        didSet {
            divisionBasicStackView.isHidden = !isDivisionBasicStackViewShown
        }
    }
    
    var currentExperience = 0
    var goalExperience = 100
    
    var level = 1
    var totalExperience = 0
    var currentDiamond = 50
    var currentHeart = 5
    
    var questionType: QuestionType = .summa
    var questionLevel: QuestionLevel = .easy
    var summaBasicPoints = 0
    var subtractionBasicPoints = 0
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        summaBasicLevelLabel.text = "Уровень 1/5"
        substractionBasicLevelLabel.text = "Уровень 1/5"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        closingAllStackView()
    }
    
    //MARK: - Custom Methods
    func performLayerCR() {
        summaBasicButton.layer.cornerRadius = 25
        summaBasicView.layer.cornerRadius = 10
        summaBasicButtonStart.layer.cornerRadius = 10
        
        subtractionBasicButton.layer.cornerRadius = 25
        substractionBasicView.layer.cornerRadius = 10
        substractionBasicButtonStart.layer.cornerRadius = 10
        
        summaSubstractionButton.layer.cornerRadius = 25
        summaSubstractionView.layer.cornerRadius = 10
        summaSubstractionButtonStart.layer.cornerRadius = 10
        
        multiplicationBasicButtton.layer.cornerRadius = 25
        
        divisionBasicButton.layer.cornerRadius = 25
    }
    
    func updateLevel() {
        if currentExperience == goalExperience {
            level += 1
            currentExperience = 0
            goalExperience *= 20 / 100
        }
    }
    
    func updateProgressView() {
        let progress = Float(currentExperience) / Float(goalExperience)
        currentProgressView.setProgress(progress, animated: true)
    }
    
    func closingAllStackView() {
        isSummaBasicStackViewShown = false
        isSubstractionBasicStackViewShown = false
        isSummaSubstractionStackViewShown = false
        isMultiplicationBasicStackViewShown = false
        isDivisionBasicStackViewShown = false
    }
    
    func updateUI() {
        performLayerCR()
        updateProgressView()
        updateLevel()
        currentExperianceLabel.text = "\(currentExperience)"
        goalExperianceLabel.text = "\(goalExperience)"
        levelLabel.text = "\(level)"
        currentDimondLabel.text = "\(currentDiamond)"
        currentHeartLabel.text = "\(currentHeart)"
    }
    
    func addAnimateButton(sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowAnimatedContent], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.alpha = 0.5
            sender.setTitleColor(#colorLiteral(red: 1, green: 0.4235294118, blue: 0.2509803922, alpha: 1), for: .normal)

        }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
                sender.alpha = 1
                sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            }
        }
    }
    
    func addAnimateViewOpening(view: UIView, stackView: UIStackView) {
        view.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.3, delay: 0.1, animations: {
            stackView.isHidden = false
            view.transform = .identity
        })
    }
    
    func addAnimateViewClosing(view: UIView, stackView: UIStackView) {
        UIView.animate(withDuration: 0.3, delay: 0.1, animations: {
            view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }) { _ in
            stackView.isHidden = true
        }
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(delay)) {
            closure()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! QuestionViewController
        destination.currentDiamond = currentDiamond
        destination.currentHeart = currentHeart
        switch questionType {
        case .summa:
            destination.questionType = QuestionType.summa
            destination.questionLevel = questionLevel
        case .substraction:
            destination.questionType = QuestionType.substraction
            destination.questionLevel = questionLevel
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        let segue = segue.source as! ResultViewController
        totalExperience += segue.experienceGained
        currentExperience += segue.experienceGained
        currentDiamond = segue.currentDiamond
        currentDiamond += segue.receivedDiamond
        currentHeart = segue.currentHeart
        updateLevel()
        closingAllStackView()
        updateUI()
        
        switch questionType {
        case .summa:
            summaBasicPoints += segue.experienceGained
        case .substraction:
            subtractionBasicPoints += segue.experienceGained
        }
    }
    
    // MARK: - Actions
    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: substractionBasicView, stackView: substractionBasicStackView)
        addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
        
        if isSummaBasicStackViewShown {
            addAnimateViewClosing(view: summaBasicView, stackView: summaBasicStackView)
            
            delay(300) {
                self.isSummaBasicStackViewShown.toggle()
            }
        } else {
            addAnimateViewOpening(view: summaBasicView, stackView: summaBasicStackView)
            
            delay(300) {
                self.isSummaBasicStackViewShown.toggle()
                self.isSubstractionBasicStackViewShown = false
                self.isSummaSubstractionStackViewShown = false
            }
        }
        
        questionType = .summa
        
        switch summaBasicPoints {
        case 0...19:
            summaBasicLevelLabel.text = "Уровень 1/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/20"
            questionLevel = .easy
        case 20...39:
            summaBasicLevelLabel.text = "Уровень 2/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/40"
            questionLevel = .normal
        case 40...59:
            summaBasicLevelLabel.text = "Уровень 3/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/60"
            questionLevel = .medium
        case 60...79:
            summaBasicLevelLabel.text = "Уровень 4/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/80"
            questionLevel = .hard
        case 80...100:
            summaBasicLevelLabel.text = "Уровень 5/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/100"
            questionLevel = .highHard
        default:
            summaBasicLevelLabel.text = "Уровень 5/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)"
            questionLevel = .highHard
        }
    }
    
    @IBAction func substractionBasicButtonAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: summaBasicView, stackView: summaBasicStackView)
        addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
        
        if isSubstractionBasicStackViewShown {
            addAnimateViewClosing(view: substractionBasicView, stackView: substractionBasicStackView)
           
            delay(300) {
                self.isSubstractionBasicStackViewShown.toggle()
            }

        } else {
            
            addAnimateViewOpening(view: substractionBasicView, stackView: substractionBasicStackView)

            delay(300) {
                self.isSubstractionBasicStackViewShown.toggle()
                self.isSummaBasicStackViewShown = false
                self.isSummaSubstractionStackViewShown = false
            }
        }
        updateUI()

        
        questionType = .substraction
        
        switch subtractionBasicPoints {
        case 0...19:
            substractionBasicLevelLabel.text = "Уровень 1/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/20"
            questionLevel = .easy
        case 20...39:
            substractionBasicLevelLabel.text = "Уровень 2/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/40"
            questionLevel = .normal
        case 40...59:
            substractionBasicLevelLabel.text = "Уровень 3/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/60"
            questionLevel = .medium
        case 60...79:
            substractionBasicLevelLabel.text = "Уровень 4/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/80"
            questionLevel = .hard
        case 80...100:
            substractionBasicLevelLabel.text = "Уровень 5/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/100"
            questionLevel = .highHard
        default:
            substractionBasicLevelLabel.text = "Уровень 5/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)"
            questionLevel = .highHard
        }
    }
    
    @IBAction func summaSubstractionAction(_ sender: UIButton) {
        isSummaSubstractionStackViewShown.toggle()
        isSummaBasicStackViewShown = false
        isSubstractionBasicStackViewShown = false
        

    }
    
    @IBAction func multiplicationBasicAction(_ sender: UIButton) {
    }
    
    
 
    
    
}
