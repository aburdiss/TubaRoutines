//
//  CreateCustomView.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A view that allows the user to select elements to be put into a routine, name the routine, and save it to local memory
 */
struct CreateCustomView: View {
    /**
     The user created routines
     */
    @EnvironmentObject var customRoutines: CustomRoutines
    
    /**
     The user selected favorites
     */
    @EnvironmentObject var favorites: Favorites
    
    /**
     The current presentation mode of the view. By exposing this variable the view is able to dismiss itself and return to the previous view (CustomListView.swift)
     */
    @Environment(\.presentationMode) var presentationMode
    
    /**
     The current vertical size class of the screen.
     */
    @Environment(\.verticalSizeClass) var sizeClass
    
    /**
     The currently selected exercise in the picker
     */
    @State private var selectedExercise = 0
    
    /**
     State variable controlling whether or not the exercise preview sheet is presented from the picker.
     */
    @State var pickerExerciseIsPresented: Bool = false
    
    /**
     State variable controlling whether or not the exercise preview sheet is presented from the list.
     */
    @State var listExerciseIsPresented: Bool = false
    
    /**
     The routine currently being constructed.
     */
    @State var currentRoutine: [String] = []
    
    /**
     The user inputted name of the routine.
     */
    @State private var name: String = ""
    
    @State private var showingNameAlert = false
    @State private var showingRoutineAlert = false
    
    /**
     The user interface
     */
    var body: some View {
        VStack {
            if sizeClass == .compact {
                HStack {
                    VStack {
                        Picker(selection: $selectedExercise, label: Text("Exercises")) {
                            ForEach(0 ..< allExercises.count) {
                                ExercisePickerView(exercise: allExercises[$0])
                            }
                        }
                        .frame(height: 200)
                        .labelsHidden()
                        Button(action: {
                            self.hideKeyboard()
                            self.pickerExerciseIsPresented.toggle()
                        }) {
                            Text("Preview")
                                .sheet(isPresented: self.$pickerExerciseIsPresented) {
                                    CustomPreviewView(
                                        image: allExercises[self.selectedExercise],
                                        isPresented: self.$pickerExerciseIsPresented
                                    )
                                    .environmentObject(self.favorites)
                                }
                        }
                    }
                    VStack {
                        Button(action: {
                            self.addExerciseToRoutine(exercise: allExercises[self.selectedExercise])
                            self.hideKeyboard()
                        }) {
                            Text("Add To List")
                                .foregroundColor(.green)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                        .padding(.vertical)
                        
                        Button(action: {
                            self.currentRoutine.removeAll()
                            self.hideKeyboard()
                        })  {
                            Text("Reset List")
                                .foregroundColor(.red)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                        }
                        .padding(.vertical)
                        
                        Button(action: {
                            self.createRoutine()
                            self.hideKeyboard()
                        }) {
                            HStack {
                                Text("Create")
                                    .foregroundColor(.yellow)
                                    .font(.title)
                                    .padding()
                            }.overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.yellow, lineWidth: 1)
                            )
                            .padding(.vertical)
                        }
                    }
                    VStack {
                        TextField("Routine Name", text: $name)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.vertical)
                            .alert(isPresented: $showingNameAlert) {
                                Alert(title: Text("Please enter a name"))
                            }
                        List {
                            ForEach(currentRoutine, id: \.self) { exercise in
                                Button(action: {
                                    self.hideKeyboard()
                                    self.listExerciseIsPresented.toggle()
                                }) {
                                    HStack {
                                        Text(exercise)
                                        if self.favorites.contains(exercise) {
                                            Image(systemName: "heart.fill")
                                                .accessibility(label: Text("This is a favorite exercise"))
                                                .foregroundColor(.red)
                                        }
                                    }
                                    .sheet(isPresented: self.$listExerciseIsPresented) {
                                        CustomPreviewView(image: exercise, isPresented: self.$listExerciseIsPresented)
                                            .environmentObject(self.favorites)
                                    }
                                }
                            }
                            .onDelete(perform: removeExercise)
                        }
                        .alert(isPresented: $showingRoutineAlert) {
                            Alert(title: Text("Please select at least one exercise"))
                        }
                    }
                }
            } else {
                TextField("Routine Name", text: $name)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .alert(isPresented: $showingNameAlert) {
                        Alert(title: Text("Please enter a name"))
                    }
                HStack {
                    Picker(selection: $selectedExercise, label: Text("Exercises")) {
                        ForEach(0 ..< allExercises.count) {
                            ExercisePickerView(exercise: allExercises[$0])
                        }
                    }
                    .labelsHidden()
                    Button(action: {
                        self.hideKeyboard()
                        self.pickerExerciseIsPresented.toggle()
                    }) {
                        Text("Preview")
                            .padding(.trailing)
                            .sheet(isPresented: self.$pickerExerciseIsPresented) {
                                CustomPreviewView(image: allExercises[self.selectedExercise], isPresented: self.$pickerExerciseIsPresented)
                                    .environmentObject(self.favorites)
                            }
                    }
                }
                HStack {
                    Button(action: {
                        self.currentRoutine.removeAll()
                        self.hideKeyboard()
                    })  {
                    Text("Reset")
                        .foregroundColor(.red)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.red, lineWidth: 1)
                        )
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        self.addExerciseToRoutine(exercise: allExercises[self.selectedExercise])
                        self.hideKeyboard()
                    }) {
                        Text("Add To List")
                            .foregroundColor(.green)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green, lineWidth: 1)
                            )
                    }
                    .padding(.horizontal)
                }
                List {
                    ForEach(currentRoutine, id: \.self) { exercise in
                        Button(action: {
                            self.hideKeyboard()
                            self.listExerciseIsPresented.toggle()
                        }) {
                            HStack {
                                Text(exercise)
                                if self.favorites.contains(exercise) {
                                    Image(systemName: "heart.fill")
                                        .accessibility(label: Text("This is a favorite exercise"))
                                        .foregroundColor(.red)
                                }
                            }
                            .sheet(isPresented: self.$listExerciseIsPresented) {
                                CustomPreviewView(image: exercise, isPresented: self.$listExerciseIsPresented)
                                    .environmentObject(self.favorites)
                            }
                        }
                    }
                    .onDelete(perform: removeExercise)
                }
                .alert(isPresented: $showingRoutineAlert) {
                    Alert(title: Text("Please select at least one exercise"))
                }
                Button(action: {
                    self.createRoutine()
                    self.hideKeyboard()
                }) {
                    HStack {
                        Spacer()
                        Text("Create")
                            .foregroundColor(.yellow)
                            .font(.title)
                            .padding()
                        Spacer()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.yellow, lineWidth: 1)
                    )
                    .padding()
                }
            }
        }
        .navigationBarTitle("Create Routine")
    }
    
    /**
     Adds exercise to routine. Allows for exercise to be added multiple times.
     */
    func addExerciseToRoutine(exercise: String) {
        currentRoutine.append(exercise)
    }
    
    /**
     Removes the currently selected exercise from the list. Triggered from the onDelete() event on a list item.
     */
    func removeExercise(at offsets: IndexSet) {
        currentRoutine.remove(atOffsets: offsets)
    }
    
    /**
     Adds routine to the custom routines list.
     */
    func createRoutine() {
        if name == "" {
            self.showingNameAlert = true
        }
        else if currentRoutine.count == 0 {
            self.showingRoutineAlert = true
        } else {
            let newRoutine = CustomRoutine(name: self.name, routine: self.currentRoutine)
            customRoutines.add(newRoutine)
            presentationMode.wrappedValue.dismiss()
        }
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct CreateCustomView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCustomView()
    }
}

