//
//  ChoiceButtonLabel.swift
//  rock-paper-scissors
//
//  Created by Félix Tineo Ortega on 22/6/22.
//

import SwiftUI

struct ChoiceButtonLabel: View{
    let sign: String
    var body: some View{
        Text(sign)
            .font(.system(size: 50))
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}
