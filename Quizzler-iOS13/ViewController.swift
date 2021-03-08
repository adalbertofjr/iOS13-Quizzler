//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    let quiz = [
        ["A slug's blood is green.", "True"],
        ["Approximately one quarter of human bones are in the feet.", "True"],
        ["The total surface area of two human lungs is approximately 70 square metres.", "True"],
        ["In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", "True"]
    ]
    var questionNumber = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - IBActions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnser = quiz[questionNumber][1]
        
        if userAnswer == actualAnser {
            print("Right!")
        }else{
            print("Wrong!")
        }
        
        if (questionNumber < quiz.count - 1) {
            questionNumber += 1
        }else{
            questionNumber = 0
        }
                        
        updateUI()
    }
    
    func updateUI(){
        lblQuestion.text = quiz[questionNumber][0]
    }
    
}

