//
//  jsonModel.swift
//  ExamApp
//
//  Created by Zülal Sarıoğlu on 23.02.2024.
//
import Foundation

struct QuizResponse: Codable {
    let results: [QuizQuestion]
}

struct QuizQuestion: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
