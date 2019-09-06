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
    @IBOutlet var viewBasic: UIView! {
        didSet {
            viewBasic.layer.cornerRadius = 10
        }
    }
    @IBOutlet var summaBasicButtonPressed: UIButton! {
        didSet {
            summaBasicButtonPressed.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Properties
    let summaQuestion = SummaQuestion(summaBasic: SummaBasicOne())
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        summaBasicStackView.isHidden = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SummaBasicSegue" else { return }
        let destination = segue.destination as! QuestionViewController
        destination.question = summaQuestion.performSummaBasic()
    }
    
    // MARK: - Actions
    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        summaBasicStackView.isHidden = false
    }
    
}
