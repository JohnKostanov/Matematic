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
    @IBOutlet var summaBasicButton: UIButton! {
        didSet {
            summaBasicButton.layer.cornerRadius = 25
        }
    }
    @IBOutlet var summaBasicStackView: UIStackView!
    @IBOutlet var summaBasicView: UIView! {
        didSet {
            summaBasicView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var summaBasicButtonStart: UIButton! {
        didSet {
            summaBasicButtonStart.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var subtractionBasicButton: UIButton! {
        didSet {
            subtractionBasicButton.layer.cornerRadius = 25
        }
    }
    @IBOutlet var substractionBasicStackView: UIStackView!
    @IBOutlet var substractionBasicView: UIView! {
        didSet {
            substractionBasicView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var substractionBasicButtonStart: UIButton! {
        didSet {
            substractionBasicButtonStart.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var summaBasicLevelLabel: UILabel!
    @IBOutlet var summaBasicPointsLabel: UILabel!
    
    
    
    
    
    // MARK: - Properties
    var summaBasicPoints = 0
    var subtractionBasicPoints = 0
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        summaBasicLevelLabel.text = "Уровень 1/5"
        summaBasicPointsLabel.text = "Очков опыта: \(summaBasicPoints)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        summaBasicStackView.isHidden = true
        substractionBasicStackView.isHidden = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SummaBasicSegue" {
            let destination = segue.destination as! QuestionViewController
            destination.questionType = QuestionType.summa
            destination.summaBasicPoints = summaBasicPoints
        } else if segue.identifier == "SubstractionBasicSegue" {
            let destination = segue.destination as! QuestionViewController
            destination.questionType = QuestionType.substraction
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        let segue = segue.source as! ResultViewController
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
        
    }
    
    // MARK: - Actions
    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        summaBasicStackView.isHidden = false
    }
    
    @IBAction func substractionBasicButtonAction(_ sender: UIButton) {
        substractionBasicStackView.isHidden = false
    }
}
