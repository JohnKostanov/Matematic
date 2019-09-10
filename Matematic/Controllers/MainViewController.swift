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
    var questionType: QuestionType = .summa
    var summaBasicPoints = 0
    var subtractionBasicPoints = 0
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        performLayerCR()
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
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        let segue = segue.source as! ResultViewController
        switch questionType {
        case .summa:
            summaBasicPoints += segue.experienceGained
            summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)"
            switch summaBasicPoints {
            case 0...30:
                summaBasicLevelLabel.text = "Уровень 1/5"
            case 30...60:
                summaBasicLevelLabel.text = "Уровень 2/5"
            default:
                summaBasicLevelLabel.text = "Уровень 3/5"
            }
        case .substraction:
            subtractionBasicPoints += segue.experienceGained
            substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)"
            switch subtractionBasicPoints {
            case 0...30:
                substractionBasicLevelLabel.text = "Уровень 1/5"
            case 30...60:
                substractionBasicLevelLabel.text = "Уровень 2/5"
            default:
                substractionBasicLevelLabel.text = "Уровень 3/5"
            }
            

        }
        
    }
    
    // MARK: - Actions
    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        questionType = .summa
        substractionBasicStackView.isHidden = true
        summaBasicStackView.isHidden = false
        
        summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)"
    }
    
    @IBAction func substractionBasicButtonAction(_ sender: UIButton) {
        questionType = .substraction
        summaBasicStackView.isHidden = true
        substractionBasicStackView.isHidden = false
        
        substractionBasicPointsLabel.text = "Очков опыта: \(subtractionBasicPoints)"
    }
    
    
 
    
    
}
