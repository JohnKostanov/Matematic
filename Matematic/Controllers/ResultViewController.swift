//
//  ResultViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 07/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var correctAnswerLabel: UILabel!
    @IBOutlet var experienceGainedLabel: UILabel!
    @IBOutlet var receivedDiamondLabel: UILabel!
    
    @IBOutlet var continueButton: UIButton!
    
    
    // MARK: - Properties
    var correctAnswer: Int!
    var currentDiamond = 0
    var currentHeart = 0

    var experienceGained: Int {
        return correctAnswer * 2
    }
    
    var receivedDiamond: Int {
        if correctAnswer == 10 {
            return 1
        } else {
            return 0
        }
    }
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        performConfigureOutlets()
        updateUI()
    }
    
    // MARK: - Custom Methods
    func performConfigureOutlets() {
        continueButton.layer.cornerRadius = 15
    }
    
    func updateUI() {
        correctAnswerLabel.text = "\(correctAnswer!) ✅"
        experienceGainedLabel.text = "\(experienceGained) 📈"
        receivedDiamondLabel.text = "\(receivedDiamond) 💎"
        
    }

}
