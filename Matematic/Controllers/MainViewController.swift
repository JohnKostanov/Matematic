//
//  MainViewController.swift
//  Matematic
//
//  Created by  Джон Костанов on 06/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit
import CoreData


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
    @IBOutlet var multiplicationBasicView: UIView!
    @IBOutlet var multiplicationBasicLevelLabel: UILabel!
    @IBOutlet var multiplicationBasicPointsLabel: UILabel!
    @IBOutlet var multiplicationBasicButtonStart: UIButton!
    
    @IBOutlet var divisionBasicButton: UIButton!
    
    @IBOutlet var divisionBasicStackView: UIStackView!
    @IBOutlet var divisionBasicView: UIView!
    @IBOutlet var divisionBasicLevelLabel: UILabel!
    @IBOutlet var divisionBasicPointsLabel: UILabel!
    @IBOutlet var divisionBasicButtonStart: UIButton!
    
    
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
    
    var currentPerson: Person?
    
    var coreDataStack: CoreDataStack!
    var managedContext: NSManagedObjectContext!
    
    var currentExperience = 0
    var goalExperience = 100
    
    var level = 1
    var totalExperience = 0
    var currentDiamond = 50
    var currentHeart = 5
    
    var questionType: QuestionType = .summa
    var questionLevel: QuestionLevel = .easy
    var summaBasicPoints = 0
    var substractionBasicPoints = 0
    var summaSubstractionPoints = 0
    var multiplicationBasicPoints = 0
    var divisionBasicPoints = 0
    
    // MARK: - UIViewController Methods
    override func viewWillAppear(_ animated: Bool) {
        closingAllStackView()
        populateCurrentExperience()
        updateUI()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personName = "John"
        let personFetch: NSFetchRequest<Person> = Person.fetchRequest()
        personFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Person.name), personName)
        
        do {
            let results = try managedContext.fetch(personFetch)
            if results.count > 0 {
                // John found, use John
                currentPerson = results.first
                print(#line, #function, currentPerson?.points?.currentExperience)
            } else {
                // John not found, create John
                currentPerson = Person(context: managedContext)
                currentPerson?.name = personName
                try managedContext.save()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        
    }
    
    
    //MARK: - Custom Methods
    func performLayerCR() {
        summaBasicButton.layer.cornerRadius = 25
        summaBasicView.layer.cornerRadius = 20
        summaBasicLevelLabel.textColor = .black
        summaBasicPointsLabel.textColor = .black
        summaBasicButtonStart.layer.cornerRadius = 20
        
        subtractionBasicButton.layer.cornerRadius = 25
        substractionBasicView.layer.cornerRadius = 20
        substractionBasicLevelLabel.textColor = .black
        substractionBasicPointsLabel.textColor = .black
        substractionBasicButtonStart.layer.cornerRadius = 20
        
        summaSubstractionButton.layer.cornerRadius = 25
        summaSubstractionView.layer.cornerRadius = 20
        summaSubstractionLevelLabel.textColor = .black
        summaSubstractionPointsLabel.textColor = .black
        summaSubstractionButtonStart.layer.cornerRadius = 20
        
        multiplicationBasicButtton.layer.cornerRadius = 25
        multiplicationBasicView.layer.cornerRadius = 20
        multiplicationBasicLevelLabel.textColor = .black
        multiplicationBasicPointsLabel.textColor = .black
        multiplicationBasicButtonStart.layer.cornerRadius = 20
        
        divisionBasicButton.layer.cornerRadius = 25
        divisionBasicView.layer.cornerRadius = 20
        divisionBasicLevelLabel.textColor = .black
        divisionBasicPointsLabel.textColor = .black
        divisionBasicButtonStart.layer.cornerRadius = 20
    }
    
    func populateCurrentExperience() {
        let fetchRequest = NSFetchRequest<NSDictionary>(entityName: "Points")
        fetchRequest.resultType = .dictionaryResultType
        
        let sumExperienceDesc = NSExpressionDescription()
        sumExperienceDesc.name = "sumExperienseTotal"
        
        let currentExperienceExp = NSExpression(forKeyPath: #keyPath(Points.currentExperience))
        sumExperienceDesc.expression = NSExpression(forFunction: "sum:", arguments: [currentExperienceExp])
        sumExperienceDesc.expressionResultType = .integer32AttributeType
        
        fetchRequest.propertiesToFetch = [sumExperienceDesc]
        
        do {
            let results  = try  managedContext.fetch(fetchRequest)
            let resultDict = results.first!
            let numCurrentExperienceTotal = resultDict["sumExperienseTotal"] as! Int
            currentExperience = numCurrentExperienceTotal
        } catch let error as NSError {
            print("Count not fetch \(error), \(error.userInfo)")
        }
    }
    
    func updateLevelAndPointsLabel(experience: Int, level: UILabel, points: UILabel) {
        switch experience {
        case 0...19:
            level.text = "Уровень 1/5"
            points.text = "Очков опыта: \(experience)/20"
            questionLevel = .easy
        case 20...39:
            level.text = "Уровень 2/5"
            points.text = "Очков опыта: \(experience)/40"
            questionLevel = .normal
        case 40...59:
            level.text = "Уровень 3/5"
            points.text = "Очков опыта: \(experience)/60"
            questionLevel = .medium
        case 60...79:
            level.text = "Уровень 4/5"
            summaBasicPointsLabel.text = "Очков опыта: \(experience)/80"
            questionLevel = .hard
        case 80...100:
            level.text = "Уровень 5/5"
            points.text = "Очков опыта: \(experience)/100"
            questionLevel = .highHard
        default:
            level.text = "Уровень 5/5"
            points.text = "Очков опыта: \(experience)"
            questionLevel = .highHard
        }
    }
    
    func updateLevel() {
        if currentExperience >= goalExperience {
            level += 1
//            currentExperience = 0
        }
        goalExperience += (goalExperience * 20) / 100
        print(#line, #function, goalExperience)
        goalExperianceLabel.text = "\(goalExperience)"
        
//        currentPerson?.points?.goalExperience = Int32(goalExperience)
//        goalExperianceLabel.text = "\(currentPerson?.points?.goalExperience ?? Int32(goalExperience))"
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
        currentPerson?.points?.level = Int16(level)
        levelLabel.text = "\(currentPerson?.points?.level ?? Int16(level))"
        currentDimondLabel.text = "\(currentPerson?.points?.currentDimond ?? Int16(currentDiamond))"
        currentHeartLabel.text = "\(currentPerson?.points?.currentHeart ?? Int16(currentHeart))"
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
            destination.questionType = .summa
            destination.questionLevel = questionLevel
        case .substraction:
            destination.questionType = .substraction
            destination.questionLevel = questionLevel
        case .summaSubstraction:
            destination.questionType = .summaSubstraction
            destination.questionLevel = questionLevel
        case .multiplication:
            destination.questionType = .multiplication
            destination.questionLevel = questionLevel
        case .division:
            destination.questionType = .division
            destination.questionLevel = questionLevel
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        let segue = segue.source as! ResultViewController
        
        let points = Points(context: managedContext)
        points.currentExperience += Int32(segue.experienceGained)
        points.currentDimond += Int16(segue.currentDiamond + segue.receivedDiamond)
        points.currentHeart = Int16(segue.currentHeart)
        
        //        totalExperience += segue.experienceGained
        currentExperience = Int(points.currentExperience)
        currentDiamond = Int(points.currentDimond)
        //        currentDiamond += segue.receivedDiamond
        currentHeart = Int(points.currentHeart)
        
        switch questionType {
        case .summa:
            points.summaBasicPoints += Int32(segue.experienceGained)
            
        case .substraction:
            points.substractionBasicPoints += Int32(segue.experienceGained)
        //            substractionBasicPoints += segue.experienceGained
        case .summaSubstraction:
            points.summaSubstractionPoints += Int32(segue.experienceGained)
        //            summaSubstractionPoints += segue.experienceGained
        case .multiplication:
            points.multiplicationBasicPoints += Int32(segue.experienceGained)
        //            multiplicationBasicPoints += segue.experienceGained
        case .division:
            points.divisionBasicPoints += Int32(segue.experienceGained)
            //            divisionBasicPoints += segue.experienceGained
        }
        
        //        if let person = currentPerson, var totalPoints = person.points {
        //            totalPoints = points
        //            person.points = totalPoints
        //        }
        
        
        do {
            try managedContext.save()
            currentPerson?.points?.currentExperience += points.currentExperience
            currentPerson?.points?.currentDimond = points.currentDimond
            currentPerson?.points?.currentHeart = points.currentHeart
            
            print("Saved completed")
            print(currentPerson?.points?.currentExperience)
            
        } catch let error as NSError {
            print("Save error: \(error), description: \(error.userInfo)")
        }
        
        
        //        currentExperianceLabel.text = "\(points.currentExperience)"
        //        currentDimondLabel.text = "\(points.currentDimond)"
        //        currentHeartLabel.text = "\(points.currentHeart)"
        //        summaBasicPointsLabel.text = "\(points.summaBasicPoints)"
        
        updateLevel()
        closingAllStackView()
        updateUI()
        
    }
    
    // MARK: - Actions
    @IBAction func summaBasicButtonAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: substractionBasicView, stackView: substractionBasicStackView)
        addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
        addAnimateViewClosing(view: divisionBasicView, stackView: divisionBasicStackView)
        
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
                self.isMultiplicationBasicStackViewShown = false
                self.isDivisionBasicStackViewShown = false
            }
        }
        
        questionType = .summa
        summaBasicPoints = Int(currentPerson!.points!.summaBasicPoints)
        
        updateLevelAndPointsLabel(experience: summaBasicPoints, level: summaBasicLevelLabel, points: summaBasicPointsLabel)
        
    }
    
    @IBAction func startSummaBasicButton(_ sender: UIButton) {
        addAnimateButton(sender: sender)
    }
    
    @IBAction func substractionBasicButtonAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: summaBasicView, stackView: summaBasicStackView)
        addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
        addAnimateViewClosing(view: divisionBasicView, stackView: divisionBasicStackView)
        
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
                self.isMultiplicationBasicStackViewShown = false
                self.isDivisionBasicStackViewShown = false
            }
        }
        //        updateUI()
        
        
        questionType = .substraction
        
        updateLevelAndPointsLabel(experience: substractionBasicPoints, level: substractionBasicLevelLabel, points: substractionBasicPointsLabel)
        
    }
    
    @IBAction func startSubstractionBasicButton(_ sender: UIButton) {
        addAnimateButton(sender: sender)
    }
    
    @IBAction func summaSubstractionAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: summaBasicView, stackView: summaBasicStackView)
        addAnimateViewClosing(view: substractionBasicView, stackView: substractionBasicStackView)
        addAnimateViewClosing(view: divisionBasicView, stackView: divisionBasicStackView)
        
        if isSummaSubstractionStackViewShown {
            addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
            
            delay(300) {
                self.isSummaSubstractionStackViewShown.toggle()
            }
            
        } else {
            
            addAnimateViewOpening(view: summaSubstractionView, stackView: summaSubstractionStackView)
            
            delay(300) {
                self.isSummaSubstractionStackViewShown.toggle()
                self.isSummaBasicStackViewShown = false
                self.isSubstractionBasicStackViewShown = false
                self.isMultiplicationBasicStackViewShown = false
                self.isDivisionBasicStackViewShown = false
            }
        }
        //        updateUI()
        
        
        questionType = .summaSubstraction
        
        updateLevelAndPointsLabel(experience: summaSubstractionPoints, level: summaSubstractionLevelLabel, points: summaSubstractionPointsLabel)
        
    }
    
    @IBAction func startSummaSubstraction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
    }
    
    @IBAction func multiplicationBasicAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: summaBasicView, stackView: summaBasicStackView)
        addAnimateViewClosing(view: substractionBasicView, stackView: substractionBasicStackView)
        addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
        
        if isMultiplicationBasicStackViewShown {
            addAnimateViewClosing(view: multiplicationBasicView, stackView: multiplicationBasicStackView)
            
            delay(300) {
                self.isMultiplicationBasicStackViewShown.toggle()
            }
            
        } else {
            
            addAnimateViewOpening(view: multiplicationBasicView, stackView: multiplicationBasicStackView)
            
            delay(300) {
                self.isMultiplicationBasicStackViewShown.toggle()
                self.isSummaBasicStackViewShown = false
                self.isSubstractionBasicStackViewShown = false
                self.isSummaSubstractionStackViewShown = false
                self.isDivisionBasicStackViewShown = false
            }
        }
        //        updateUI()
        
        questionType = .multiplication
        
        updateLevelAndPointsLabel(experience: multiplicationBasicPoints, level: multiplicationBasicLevelLabel, points: multiplicationBasicPointsLabel)
        
    }
    
    @IBAction func startMultiplicationBasic(_ sender: UIButton) {
        addAnimateButton(sender: sender)
    }
    
    @IBAction func divisionBasicAction(_ sender: UIButton) {
        addAnimateButton(sender: sender)
        addAnimateViewClosing(view: summaBasicView, stackView: summaBasicStackView)
        addAnimateViewClosing(view: substractionBasicView, stackView: substractionBasicStackView)
        addAnimateViewClosing(view: summaSubstractionView, stackView: summaSubstractionStackView)
        addAnimateViewClosing(view: multiplicationBasicView, stackView: multiplicationBasicStackView)
        
        if isDivisionBasicStackViewShown {
            addAnimateViewClosing(view: divisionBasicView, stackView: divisionBasicStackView)
            
            delay(300) {
                self.isDivisionBasicStackViewShown.toggle()
            }
            
        } else {
            
            addAnimateViewOpening(view: divisionBasicView, stackView: divisionBasicStackView)
            
            delay(300) {
                self.isDivisionBasicStackViewShown.toggle()
                self.isSummaBasicStackViewShown = false
                self.isSubstractionBasicStackViewShown = false
                self.isSummaSubstractionStackViewShown = false
                self.isMultiplicationBasicStackViewShown = false
            }
        }
        //        updateUI()
        
        questionType = .division
        
        updateLevelAndPointsLabel(experience: divisionBasicPoints, level: divisionBasicLevelLabel, points: divisionBasicPointsLabel)
        
    }
    
    @IBAction func startDivisionBasic(_ sender: UIButton) {
        addAnimateButton(sender: sender)
    }
    
}
