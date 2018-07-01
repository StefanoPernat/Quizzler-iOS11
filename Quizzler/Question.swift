//
//  Question.swift
//  Quizzler
//
//  Created by Stefano Pernat on 30/06/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let questionAnswer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        questionAnswer = correctAnswer
    }
}
