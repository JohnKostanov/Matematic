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
    
    // MARK: - Properties
    var currentExperience = 0
    var goalExperience = 100
    
    var level = 1
    var totalExperience = 0
    var currentDiamond = 0
    
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
        summaBasicStackView.isHidden = true
        substractionBasicStackView.isHidden = true
    }
    
    //MARK: - Custom Methods
    func performLayerCR() {
        summaBasicButton.layer.cornerRadius = 25
        summaBasicView.layer.cornerRadius = 10
        summaBasicButtonStart.layer.cornerRadius = 10
        subtractionBasicButton.layer.cornerRadius = 25
        substractionBasicView.layer.cornerRadius = 10
        substractionBasicButtonStart.layer.cornerRadius = 10
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
    
    func updateUI() {
        performLayerCR()
        updateProgressView()
        updateLevel()
        currentExperianceLabel.text = "\(currentExperience)"
        goalExperianceLabel.text = "\(goalExperience)"
        levelLabel.text = "\(level)"
        currentDimondLabel.text = "\(currentDiamond)"
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch questionType {
        case .summa:
            let destination = segue.destination as! QuestionViewController
            destination.questionType = QuestionType.summa
            destination.summaBasicPoints = summaBasicPoints
        case .substraction:
            let destination = segue.destination as! QuestionViewController
            destination.questionType = QuestionType.substraction
            destination.questionLevel = questionLevel
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        let segue = segue.source as! ResultViewController
        totalExperience += segue.experienceGained
        currentExperience += segue.experienceGained
        currentDiamond += segue.receivedDiamond
        updateLevel()
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
        questionType = .summa
        substractionBasicStackView.isHidden = true
        summaBasicStackView.isHidden = false
        
        switch summaBasicPoints {
        case 0...30:
            summaBasicLevelLabel.text = "Уровень 1/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/30"
            questionLevel = .easy
        case 30...60:
            summaBasicLevelLabel.text = "Уровень 2/5"
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)/60"
            questionLevel = .normal
        default:
            summaBasicLevelLabel.text = "Уровень 3/5"
        }
    }
    
    @IBAction func substractionBasicButtonAction(_ sender: UIButton) {
        questionType = .substraction
        summaBasicStackView.isHidden = true
        substractionBasicStackView.isHidden = false
        
        switch subtractionBasicPoints {
        case 0...30:
            substractionBasicLevelLabel.text = "Уровень 1/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/30"
            questionLevel = .easy
        case 30...60:
            substractionBasicLevelLabel.text = "Уровень 2/5"
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)/60"
            questionLevel = .normal
        default:
            substractionBasicLevelLabel.text = "Уровень 3/5"
        }
    }
    
    
 
    
    
}
