//
//  RoutineView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
The Daily routine is shown in this view. User settings are checked on view load, and from user settings a new routine is generated.
*/
struct RoutineView: View {
    /**
    The user selected settings. Used to determine what exercises to select for the routine. Settings are determined in SettingsView.swift
    */
    @EnvironmentObject var settings: settingsModel
    
    /**
    The user selected favorites.
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
    @State var routine = ["1"]
    
    /**
    The index of the current exercise in routine array. Incremented by the user after performing the exercise.
    */
    @State var thisExercise = 0
    
    /**
     The user interface
     */
    var body: some View {
        VStack() {
            Image(routine[thisExercise])
                .resizable()
                .scaledToFit()
        }
        .alert(isPresented: $finishedRoutine) {
            Alert(title: Text("Daily Routine Complete!"), dismissButton: .default(Text("Return")) {
                self.presentationMode.wrappedValue.dismiss()
                })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(
            Text("\(self.thisExercise + 1)/\(self.routine.count)")
                .font(.headline)
            , displayMode: .inline)
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
                    if self.favorites.contains(self.routine[self.thisExercise]) {
                        self.favorites.remove(self.routine[self.thisExercise])
                    } else {
                        self.favorites.add(self.routine[self.thisExercise])
                    }
                }) {
                    favorites.contains(routine[thisExercise]) ?
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
        .onAppear() {
            self.generateRoutine()
        }
    }
    
    /**
     Generates a random routine from available exercises
     */
    func generateRoutine() {
        var tempExercise: String
        var newRoutine: [String] = []
        
        checkDefaults()
        self.settings.objectWillChange.send()
        
        /// Adds one long tone
        if self.settings.longTonesToggle {
            newRoutine.append(longTones.randomElement()!)
            if (settings.selectedDifficulty > 1) {
                repeat {
                    tempExercise = longTones.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
        }
       
        /// Adds two slow lip slurs
        if self.settings.slowLipSlursToggle {
            newRoutine.append(slowLipSlurs.randomElement()!)
            if (settings.selectedDifficulty > 0) {
                repeat {
                    tempExercise = slowLipSlurs.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
            if (settings.selectedDifficulty > 1) {
                repeat {
                    tempExercise = slowLipSlurs.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
        }
       
        
        /// Adds two fast lip slurs
        if self.settings.fastLipSlursToggle {
            newRoutine.append(fastLipSlurs.randomElement()!)
            if (settings.selectedDifficulty > 0) {
                repeat {
                    tempExercise = fastLipSlurs.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
            if (settings.selectedDifficulty > 1) {
                repeat {
                    tempExercise = fastLipSlurs.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
        }

        /// Adds two static articulation
        if self.settings.staticArticulationToggle {
             newRoutine.append(staticArticulation.randomElement()!)
            if (settings.selectedDifficulty > 0) {
                repeat {
                    tempExercise = staticArticulation.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
            if (settings.selectedDifficulty > 1) {
                repeat {
                    tempExercise = staticArticulation.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
            
        }

        /// Adds two variable articulation
        if settings.variableArticulationToggle {
            newRoutine.append(variableArticulation.randomElement()!)
            if (settings.selectedDifficulty > 0) {
                repeat {
                    tempExercise = variableArticulation.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
            if (settings.selectedDifficulty > 1) {
                repeat {
                    tempExercise = variableArticulation.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
            
        }

        /// Adds one scale
        if settings.majorScalesToggle && settings.selectedDifficulty > 0 {
            newRoutine.append(scales.randomElement()!)
            if (settings.selectedDifficulty > 1) {
                repeat {
                    tempExercise = scales.randomElement()!
                } while newRoutine.contains(tempExercise)
                newRoutine.append(tempExercise)
            }
        }

        /// Adds one high range
        if settings.highRangeToggle {
            newRoutine.append(highRange.randomElement()!)
        }

        /// Adds one low range
        if settings.lowRangeToggle  {
            newRoutine.append(lowRange.randomElement()!)
        }
        
        /// Sets new routine
        self.routine = newRoutine
    }
    
    /**
     Goes forward one exercise. If at last exercise, shows alert that exits routine.
     */
    func getNextExercise() {
        if (self.thisExercise == routine.count - 1) {
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
    
    /**
    Checks the user defaults to make sure they have been initialized, and if not, initializes all settings to defaults.
    Settings may not be initialized in user launches app for the first time.
    */
    func checkDefaults() {
        if !settings.longTonesToggle &&
            !settings.slowLipSlursToggle &&
            !settings.fastLipSlursToggle &&
            !settings.staticArticulationToggle &&
            !settings.variableArticulationToggle &&
            !settings.majorScalesToggle &&
            !settings.highRangeToggle &&
            !settings.lowRangeToggle
        {
            settings.longTonesToggle = true
            settings.slowLipSlursToggle = true
            settings.fastLipSlursToggle = true
            settings.staticArticulationToggle = true
            settings.variableArticulationToggle = true
            settings.majorScalesToggle = true
            settings.highRangeToggle = true
            settings.lowRangeToggle = true
            settings.selectedDifficulty = 1
        }
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView().environmentObject(settingsModel()).environmentObject(Favorites())
    }
}

