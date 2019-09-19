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
    
    func addAnimateButton(sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            sender.alpha = 0.5
            sender.setTitleColor(#colorLiteral(red: 0.05098039216, green: 0.4509803922, blue: 1, alpha: 1), for: .normal)
            
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
                sender.alpha = 1
                sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            }
        }
    }
    
    func updateUI() {
        correctAnswerLabel.text = "\(correctAnswer!) ✅"
        experienceGainedLabel.text = "\(experienceGained) 📈"
        receivedDiamondLabel.text = "\(receivedDiamond) 💎"
        
    }

    @IBAction func continueButtonAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
    }
}
