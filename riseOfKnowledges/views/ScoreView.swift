//
//  ScoreView.swift
//  riseOfKnowledges
//
//  Created by Florian Beaumont on 9/23/20.
//  Copyright © 2020 Florian Beaumont. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    
    @ObservedObject var scoreDatas = ScoreViewModel()
    
    var userDatas: ScoreViewModel
    
    var body: some View {
        VStack {
            if self.scoreDatas.allScore.isEmpty {
                Indicator()
            } else {
                VStack {
                    Spacer()
                    Spacer()
                    Text("🏆 LEADERBOARD 🏆")
                        .font(.largeTitle)
                        .font(.system(size: 46))
                        .fontWeight(.bold)
                    List(self.scoreDatas.allScore) { scoreData in
                        HStack {
                            Text(String(scoreData.rank))
                            Text(scoreData.name)
                            Spacer()
                            Text(String(scoreData.score))
                        }
                        .foregroundColor(Color.black)
                    }
                }
            }
        }
        .onAppear() {
            self.userDatas.postScore()
            self.scoreDatas.getScore()
        }
        .background(Color("DarkBlue"))
    }
}
