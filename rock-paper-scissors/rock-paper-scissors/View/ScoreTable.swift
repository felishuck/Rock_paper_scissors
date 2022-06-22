//
//  ScoreTable.swift
//  rock-paper-scissors
//
//  Created by Félix Tineo Ortega on 22/6/22.
//

import SwiftUI

struct ScoreTable: View{
    let scoreLeft: Int
    let scoreRight: Int
    
    var body: some View{
        HStack{
            Text("Bot: \(scoreLeft)")
            Spacer()
            Text("You: \(scoreRight)")
        }.font(.title)
            .padding(.horizontal,40)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .foregroundStyle(.secondary)
    }
}
