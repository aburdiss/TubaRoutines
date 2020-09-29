//
//  ExercisePickerView.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A struct that allows an HStack in a picker interface that indicates which exercises are favorites.
 */
struct ExercisePickerView: View {
    /**
     The user selected Favorites
     */
    @EnvironmentObject var favorites: Favorites
    
    /**
     The current exercise number
     */
    var exercise: String
    
    /**
     The picker interface
     */
    var body: some View {
        HStack {
            Text(exercise)
            if self.favorites.contains(exercise) {
                Image(systemName: "heart.fill")
                    .accessibility(label: Text("This is a favorite exercise"))
                    .foregroundColor(.red)
            }
        }
    }
}

struct ExercisePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePickerView(exercise: "1")
    }
}
