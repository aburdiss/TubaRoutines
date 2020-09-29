//
//  FavoritesView.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A view that randomizes the user selected favorite exercises.
 */
struct FavoritesView: View {
    /**
     The user selected favorites.
     */
    @EnvironmentObject var favorites: Favorites
    
    /**
     The current presentation mode of the view. By exposing this variable the view is able to dismiss itself and return to the previous view (MainView.swift)
     */
    @Environment(\.presentationMode) var presentationMode
    
    /**
     A state vartiable showing whether the noFavorites alert will show
     */
    @State private var noFavorites = false
    
    /**
     A state variable showing whether the finishedRoutine alert will show
     */
    @State private var favoritesComplete = false
    
    /**
     The list of exercises to randomize through. Initialized to an empty array.
     */
    @State var exercises = ["1"]
    
    /**
     The current exercise in the array that
     */
    @State var thisExercise = 0
    
    /**
     The user interface
     */
    var body: some View {
        VStack {
            Image(exercises[thisExercise])
                .resizable()
                .scaledToFit()
        }
        .alert(isPresented: $noFavorites) {
            Alert(title: Text("No Favorites Selected!"), dismissButton:
                .default(Text("Return")) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(
            Text("\(self.thisExercise + 1)/\(self.exercises.count)"), displayMode: .inline
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
        }, trailing: Button(action: {
            self.getNextExercise()
        }) {
            HStack {
                Text("Next")
                    .font(.headline)
                Image(systemName: "chevron.right")
                    .font(.headline)
            }
            .alert(isPresented: $favoritesComplete) {
                Alert(title: Text("Daily Routine Complete!"), dismissButton:
                    .default(Text("Return")) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        })
        .onAppear() {
            self.loadFavorites()
        }
    }
    
    /**
     Loads shuffled favorites from memory. If no favorites, displays alert that exits routine
     */
    func loadFavorites() {
        if !self.favorites.isEmpty() {
            self.exercises = favorites.getAllFavorites().shuffled()
        } else {
            self.noFavorites = true
        }
    }
    
    /**
     Goes forward one exercise. If at last exercise, shows alert that exits routine.
     */
    func getNextExercise() {
        if (thisExercise == exercises.count - 1) {
            self.favoritesComplete = true
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

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(Favorites())
    }
}
