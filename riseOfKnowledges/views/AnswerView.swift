//
//  AnswerView.swift
//  riseOfKnowledges
//
//  Created by Florian Beaumont on 9/15/20.
//  Copyright © 2020 Florian Beaumont. All rights reserved.
//

import SwiftUI

struct AnswerView: View {
    
    @State private var showResultView: Bool = false
    @State private var isCorrect: Bool = false
    @State private var userAnswer: String = ""
    
    var questionNumber: Int
    var apiQuizDatas: QuizzViewModel
    var userDatas: ScoreViewModel
    
    
    var body: some View {
        VStack {
            ForEach(apiQuizDatas.quizz[questionNumber].suggestion, id: \.self) { item in
                VStack {
                    Button(action: {
                        userAnswer = item
                        isCorrect = item == apiQuizDatas.quizz[questionNumber].answer ? true : false
                        self.showResultView = true
                    }) {
                        Text(item)
                            .foregroundColor(.white)
                            .frame(minWidth: 100, idealWidth: 300, maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }
                    .fullScreenCover(isPresented: $showResultView, content: {
                        ResultView(
                            isCorrect: self.$isCorrect,
                            userAnswer: $userAnswer,
                            questionNumber: questionNumber,
                            apiQuizDatas: apiQuizDatas,
                            userDatas: self.userDatas
                        )
                    })
                    .padding()
                    .cornerRadius(8)
                    .opacity(0.6)
                }
            }
        }
    }
}
