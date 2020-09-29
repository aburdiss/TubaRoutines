//
//  HomeButton.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A styled button that displays on the MainView of the app
 */
struct HomeButton: View {
    /**
     The text of the button
     */
    var text: String
    
    /**
     The user interface
     */
    var body: some View {
        HStack {
            Text(NSLocalizedString(text, comment: ""))
                .font(.title)
            Image(systemName: "play")
                .font(.title)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.yellow, lineWidth: 2)
        )
        .padding()
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton(text: "Begin Routine")
    }
}
