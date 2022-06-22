//
//  GameViewModel.swift
//  rock-paper-scissors
//
//  Created by Félix Tineo Ortega on 22/6/22.
//

import Foundation

class GameViewModel: ObservableObject{
    let choices = ["👊🏻","✋🏻","✌🏻"]
    
    let maxRounds: Int = 10
    @Published var currentRound: Int = 1
    
    @Published var userChoice: Int = 0
    @Published var botChoice: Int = 0
    
    @Published var userScore: Int = 0
    @Published var botScore: Int = 0
    
    @Published var areChoicesShown = false
    
    @Published var isResultAlertShown = false
    @Published var isNewGameAlertShown = false
    
    @Published var alertMessage = ""
    
    func newGame(){
        userScore = 0
        botScore = 0
        currentRound = 1
        isNewGameAlertShown = false
    }
    
    func playRound(){
        if currentRound < maxRounds{
            botChoice = Int.random(in: 0..<3)
            computeResult()
            areChoicesShown = true
            Task{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isResultAlertShown = true
                }
            }
            
        } else {
            isNewGameAlertShown = true
        }

    }
    
    func computeResult(){
        if botChoice == 0 {
            if userChoice == 0 {
                draw()
            } else if userChoice == 1 {
                userWin()
            } else {
                userLose()
            }
        } else if botChoice == 1 {
            if userChoice == 0 {
                userLose()
            } else if userChoice == 1 {
                draw()
            } else {
                userWin()
            }
        } else {
            if userChoice == 0 {
                userWin()
            } else if userChoice == 1 {
                userLose()
            } else {
                draw()
            }
        }
    }
    
    func draw(){
        print("Draw")
        alertMessage = "Draw"
    }
    
    func userWin(){
        print("Win")
        alertMessage = "You won!"
        userScore += 1
    }
    
    func userLose(){
        print("Lose")
        alertMessage = "You lost!"
        botScore += 1
    }
    
}
