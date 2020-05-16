//
//  ContentView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
            SettingsView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
            }
        }
        .environmentObject(settingsModel())
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
