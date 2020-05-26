//
//  RoutineView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct RoutineView: View {
    @EnvironmentObject var settings: settingsModel
    @EnvironmentObject var favorites: Favorites
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var finishedRoutine = false
    
    @State var routine = ["1"]
    @State var thisExercise = 0
    
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
        
        checkDefaults()
        self.settings.objectWillChange.send()
        var tempExercise: String
        var newRoutine: [String] = []
        
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

