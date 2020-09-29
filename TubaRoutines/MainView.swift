//
//  MainView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
The initial view of the app that contains the button to begin the routine.
*/
struct MainView: View {
    /**
     The user interface
     */
    var body: some View {
        NavigationView() {
            VStack {
                NavigationLink(destination:
                    RoutineView()
                ) {
                    HomeButton(text: "Begin Routine")
                }
                NavigationLink(destination:
                    FavoritesView()
                ) {
                    HomeButton(text: "Randomize Favorites")
                }
            }
            .navigationBarTitle("Tuba Routines")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
