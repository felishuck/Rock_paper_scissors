//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Félix Tineo Ortega on 22/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.pink, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScoreTable(scoreLeft: viewModel.botScore, scoreRight: viewModel.userScore)
                    .padding()
                Text("Round: \(viewModel.currentRound)/\(viewModel.maxRounds)")
                    .foregroundColor(.white)
                Text("🤖")
                    .font(.system(size: 70))

                if viewModel.areChoicesShown{
                    VStack(){
                        Spacer()
                        Text(viewModel.choices[viewModel.botChoice])
                            .font(.system(size: 70))
                        Spacer()
                        Spacer()
                        Text(viewModel.choices[viewModel.userChoice])
                            .font(.system(size: 70))
                        Spacer()
                    }
                } else {
                    VStack(){
                        Spacer()
                        Text(viewModel.choices[viewModel.botChoice])
                            .font(.system(size: 70))
                        Spacer()
                        Spacer()
                        Text(viewModel.choices[viewModel.userChoice])
                            .font(.system(size: 70))
                        Spacer()
                    }
                    .hidden()
                }
                VStack {
                    Text("Choose Rock, Paper or Scissors")
                        .lineLimit(2)
                        .font(.title)
                        .foregroundColor(.white)
                    HStack{
                        ForEach(0..<3){index in
                            Button {
                                viewModel.userChoice = index
                                viewModel.playRound()
                            } label: {
                                ChoiceButtonLabel(sign: viewModel.choices[index])
                            }
                        }
                    }
                }.padding(.bottom, 40)
            }
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.isResultAlertShown) {
                Button("Next Round"){
                    viewModel.areChoicesShown = false
                    viewModel.currentRound += 1
                }
            }
        .alert("Game Over", isPresented: $viewModel.isNewGameAlertShown) {
                Button("New Game"){
                    viewModel.newGame()
                }
            } message: {
                Text("Bot: \(viewModel.botScore) You: \(viewModel.userScore)")
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
