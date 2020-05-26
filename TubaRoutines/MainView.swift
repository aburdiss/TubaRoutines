//
//  MainView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var settings: settingsModel
    
    var body: some View {
        NavigationView() {
            VStack {
                NavigationLink(destination:
                    RoutineView()
                ) {
                    HStack {
                        Text("Begin Routine")
                            .font(.title)
                        Image(systemName: "play")
                            .font(.title)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.yellow, lineWidth: 2))
                    .padding()
                    
                }
                
            }
            .onAppear() {
                self.checkFirstBoot()
            }
            
            .navigationBarTitle("Tuba Routines")
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func checkFirstBoot() {
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
