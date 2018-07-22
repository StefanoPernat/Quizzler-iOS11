//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class QuizzlerViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber = 0
    var score = 0 {
        didSet {
            updateUI()
        }
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = allQuestions.list[questionNumber].questionText
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        if questionNumber != allQuestions.list.count {
            progressLabel.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
            progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        }
        
    }
    

    func nextQuestion() {
        if questionNumber == allQuestions.list.count {
            let endOfQuizAlert = UIAlertController(
                title: "Awesome",
                message: "You've finished all the questions, do you want to start over?",
                preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { [unowned self] _ in
                self.startOver()
            }
            
            endOfQuizAlert.addAction(restartAction)
            
            present(endOfQuizAlert, animated: true)
        } else {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        
        updateUI()
    }
    
    
    func checkAnswer() {
        let answer = allQuestions.list[questionNumber].questionAnswer
        if answer == pickedAnswer {
            score += 1
            print("You got it!")
        } else {
            print("Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
