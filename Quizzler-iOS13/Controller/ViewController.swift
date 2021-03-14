//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // MARK: - Variable
    var quizBrain = QuizBrain()
    
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
        guard let userAnswer = sender.currentTitle else { return }
        
        let checkAnswerIsRight = quizBrain.check(answer: userAnswer)
                
        if checkAnswerIsRight {
            trueButton.backgroundColor = UIColor.green
        }else{
            falseButton.backgroundColor = UIColor.red
        }
                       
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false)
    }
    
    @objc func updateUI(){
        lblQuestion.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

