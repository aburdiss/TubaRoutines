//
//  ContentView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
The Overlaying view containing the app. This view contains the tab view, and is the parent view responsible for passing environment variables into the rest of the app.
*/
struct ContentView: View {
    /**
    The user interface
    */
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Routine")
            }
            ListView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("All Exercises")
            }
            CustomListView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Custom")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
            }
        }
        .environmentObject(Settings())
        .environmentObject(CustomRoutines())
        .environmentObject(Favorites())
        .animation(.none)
        .accentColor(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
