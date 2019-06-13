//
//  ViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 08/06/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFirst = UInt8(arc4random_uniform(100))
    var numberSecond = UInt8(arc4random_uniform(100))

    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var respuesta: UILabel!
    
    

    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        respuesta.text = respuesta.text! + number
    }
    
//    func respuestaDelet() -> Void {
//        respuesta.text = ""
//    }
//
    @IBAction func resultCorrect(_ sender: UIButton) {
        let summaNumbers = numberFirst + numberSecond
        let respuestaNumber = UInt8(respuesta.text!)
        
       if summaNumbers == respuestaNumber {
        
    
            let alertControler = UIAlertController(title: "Ваш ответ правильный!", message: "Продолжайте в том же духе! Побробуйте снова ваши силы! ", preferredStyle: UIAlertController.Style.alert)
            alertControler.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertControler, animated: true, completion: nil)
        
            numberFirst = UInt8(arc4random_uniform(100))
            numberSecond = UInt8(arc4random_uniform(100))
            question.text = "Решите пример: \(numberFirst) + \(numberSecond)"
            
           
            
        } else {
            let alertControler = UIAlertController(title: "Ваш ответ не верен!", message: "Побробуйте еще разочек! У вас все получится!", preferredStyle: UIAlertController.Style.alert)
            alertControler.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertControler, animated: true, completion: nil)

        }
        
        respuesta.text = ""
        
        

    
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = "Решите пример: \(numberFirst) + \(numberSecond)"
        question.textAlignment = .center
        question.textColor = .green
        
        respuesta.text = ""
        respuesta.textColor = .init(red: 55, green: 55, blue: 55, alpha: 1)
        respuesta.textAlignment = .center
        
    
        
        
        
        
    }
    
    
    
    
  
}

