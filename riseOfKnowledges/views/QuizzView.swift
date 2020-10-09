//
//  QuizzView.swift
//  riseOfKnowledges
//
//  Created by Florian Beaumont on 9/15/20.
//  Copyright © 2020 Florian Beaumont. All rights reserved.
//

import SwiftUI

struct QuizzView: View {
    
    @State private var showScoreView: Bool = false
    
    var apiDatas: QuizzViewModel?
    var userDatas: ScoreViewModel
    var questionNumber: Int = 0
    
    var body: some View {
        guard let apiQuizDatas = apiDatas else {
            return AnyView(HomeView())
        }
        return AnyView(
            VStack {
                Spacer()
                QuestionView(
                    question: apiQuizDatas.quizz[questionNumber].question
                )
                AnswerView(
                    questionNumber: questionNumber,
                    apiQuizDatas: apiQuizDatas,
                    userDatas: self.userDatas
                )
                Spacer()
            }
            .background(Color("NightBlue"))
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        )
    }
}
