//
//  CustomListView.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A list of all of the custom routines in the app.
 */
struct CustomListView: View {
    /**
     The list of user selected routines
     */
    @EnvironmentObject var customRoutines: CustomRoutines
    
    /**
     The user interface
     */
    var body: some View {
        NavigationView {
            VStack {
                if customRoutines.routines.count == 0 {
                    NavigationLink(destination: CreateCustomView()) {
                        HStack {
                            Text("Create Routine")
                                .font(.title)
                            Image(systemName: "pencil")
                                .font(.title)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.yellow, lineWidth: 2)
                        )
                        .padding()
                    }
                } else {
                    List {
                        ForEach(customRoutines.routines) { routine in
                            NavigationLink(destination: CustomRoutineView(routine: routine)) {
                                Text(routine.name)
                                if routine.routine.count == 1 {
                                     Text("(1 exercise)")
                                } else {
                                     Text("(\(routine.routine.count) ") + Text("exercises") + Text(")")
                                }
                            }
                        }
                        .onDelete(perform: removeRoutine)
                        .onMove(perform: moveRoutine)
                    }
                }
            }
            .navigationBarTitle("Custom Routines")
            .navigationBarItems(
                leading:
                    customRoutines.routines.count > 0 ?
                        AnyView(EditButton()) :
                        AnyView(EmptyView()),
                trailing:
                    NavigationLink(destination:
                        CreateCustomView()
                    ) {
                        Text("Create")
                        Image(systemName: "pencil")
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    /**
     Removes the routine from the list.
     */
    func removeRoutine (at offsets: IndexSet) {
        customRoutines.routines.remove(atOffsets: offsets)
        customRoutines.save()
    }
    
    func moveRoutine (source: IndexSet, destination: Int) {
        customRoutines.routines.move(fromOffsets: source, toOffset: destination)
        customRoutines.save()
    }
}


struct CustomListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomListView()
    }
}
