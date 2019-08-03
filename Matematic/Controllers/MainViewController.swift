//
//  MainViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaBasicStackView.isHidden = true

    }
    

    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        summaBasicStackView.isHidden = false
    }
    
}
