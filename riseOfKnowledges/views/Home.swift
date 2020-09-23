//
//  Home.swift
//  riseOfKnowledges
//
//  Created by Florian Beaumont on 9/17/20.
//  Copyright © 2020 Florian Beaumont. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var username: String = ""
    @State private var showQuizzView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .center, spacing: 15) {
                    NavigationLink(destination: QuizzView(), isActive: $showQuizzView) {
                        EmptyView()
                    }
                    Image("rok")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .padding(.bottom, 50)
                        .padding(.top, 100)
                    
                    HStack (alignment: .center) {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .opacity(0.1)
                        TextField("Username", text: $username)
                            .foregroundColor(.white)
                            .frame(width: 270, height: 50)
                        if username != "" {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(.systemGray6))
                                .onTapGesture {
                                    self.username = ""
                                }
                        }
                    }
                    .padding()
                    .background(Color("DarkBlue"))
                    .cornerRadius(20.0)
                    .padding(.vertical, 10)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
                    
                    Button(action: { self.showQuizzView = true }) {
                        Text("Play")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                            .opacity(70.0)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                .background(Color("NightBlue"))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}