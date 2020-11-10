//
//  ExerciseDetailView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
Displays an exercise when clicked in ListView.
*/
struct ExerciseDetailView: View {
    /**
    The user selected favorites
    */
    @EnvironmentObject var favorites: Favorites
    
    /**
    The image name to display.
    */
    var image: String
    
    /**
    The user interface
    */
    var body: some View {
        VStack{
            Image(self.image)
                .resizable()
                .scaledToFit()
        }
        .navigationBarItems(trailing:
            Button(action: {
                if self.favorites.contains(self.image) {
                    self.favorites.remove(self.image)
                } else {
                    self.favorites.add(self.image)
                }
            }) {
                favorites.contains(image)
                ?
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                :
                Image(systemName: "heart")
                    .foregroundColor(.yellow)
            }
            .padding()
        )
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(image: "0")
    }
}
