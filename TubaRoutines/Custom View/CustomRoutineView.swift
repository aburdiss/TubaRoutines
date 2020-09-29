//
//  CustomRoutineView.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A view showing one custom routine, with the functionality to move through the routine.
 */
struct CustomRoutineView: View {
    /**
     The custom routines created by the user
     */
    @EnvironmentObject var customRoutines: CustomRoutines
    
    /**
     The user selected favorites
     */
    @EnvironmentObject var favorites: Favorites
    
    /**
     The current presentation mode of the view. By exposing this variable the view is able to dismiss itself and return to the previous view (MainView.swift)
     */
    @Environment(\.presentationMode) var presentationMode
    
    /**
     State variable used to determine whether or not the finishedRoutine modal is displayed.
     */
    @State private var finishedRoutine = false
    
    /**
     The generated routine stored as an array of exercises. Initialized to an arbitrary set of exercises to avoid compiler complaints and is updated on view load according to user defined settings.
     */
    @State var routine: CustomRoutine
    
    /**
     The index of the current exercise in routine array. Incremented by the user after performing the exercise.
     */
    @State var thisExercise = 0
    
    /**
     The user interface
     */
    var body: some View {
        VStack {
            Image(routine.routine[thisExercise])
                .resizable()
                .scaledToFit()
        }
        .alert(isPresented: $finishedRoutine) {
            Alert(title: Text("Daily Routine Complete!"), dismissButton:
                .default(Text("Return")) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(
            Text("\(self.thisExercise + 1)/\(self.routine.routine.count)"), displayMode: .inline
        )
        .navigationBarItems(leading: Button(action: {
            self.getPreviousExercise()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.headline)
                Text("Back")
                    .font(.headline)
            }
        }, trailing: HStack {
            Button(action: {
                if self.favorites.contains(self.routine.routine[self.thisExercise]) {
                    self.favorites.remove(self.routine.routine[self.thisExercise])
                } else {
                    self.favorites.add(self.routine.routine[self.thisExercise])
                }
            }) {
                favorites.contains(routine.routine[thisExercise])
                    ?
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .foregroundColor(.red)
                    :
                    Image(systemName: "heart")
                        .font(.headline)
                        .foregroundColor(.yellow)
            }
            Button(action: {
                self.getNextExercise()
            }) {
                HStack {
                    Text("Next")
                        .font(.headline)
                    Image(systemName: "chevron.right")
                        .font(.headline)
                }
            }
        })
        .environmentObject(favorites)
    }
    
    /**
     Goes forward one exercise. If at last exercise, shows alert that exits routine.
     */
    func getNextExercise() {
        if (self.thisExercise == routine.routine.count - 1) {
            self.finishedRoutine = true
        } else {
            self.thisExercise += 1
        }
    }
    
    /**
     Goes back one exercise. If at first exercise, exits routine.
     */
    func getPreviousExercise() {
        if (self.thisExercise == 0) {
            presentationMode.wrappedValue.dismiss()
        } else {
            self.thisExercise -= 1
        }
    }
}


struct CustomRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRoutineView(routine: CustomRoutine(name: "My First Routine", routine: ["1", "2", "3"]))
    }
}

