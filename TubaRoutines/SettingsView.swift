//
//  SettingsView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
Allows the user to taylor the routine to their needs. Resources and other options displayed in this view.
*/
struct SettingsView: View {
    /**
    The user selected preferences.
    */
    @EnvironmentObject var settings: settingsModel
    
    /**
     The user selected Favorites
     */
    @EnvironmentObject var favorites: Favorites
    
    /**
     State variable that determines whether the resettingFavorites Alert Sheet will show.
     */
    @State private var resettingFavoritesAlert = false
    
    /**
     The user interface
     */
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Fundamentals")) {
                        Toggle(isOn: $settings.longTonesToggle) {
                            Text("Long Tones")
                        }
                        Toggle(isOn: $settings.slowLipSlursToggle) {
                            Text("Slow Lip Slurs")
                        }
                        Toggle(isOn: $settings.fastLipSlursToggle) {
                            Text("Fast Lip Slurs")
                        }
                        Toggle(isOn: $settings.staticArticulationToggle) {
                            Text("Single Note Articulation")
                        }
                        Toggle(isOn: $settings.variableArticulationToggle) {
                            Text("Moving Note Articulation")
                        }
                        Toggle(isOn: $settings.majorScalesToggle) {
                            Text("Scales")
                        }
                        Toggle(isOn: $settings.highRangeToggle) {
                            Text("High Range")
                        }
                        Toggle(isOn: $settings.lowRangeToggle) {
                            Text("Low Range")
                        }
                        
                    }
                    Section(header: Text("Routine Length")) {
                        Picker(selection: $settings.selectedDifficulty, label:Text("Routine Length")) {
                            ForEach(0 ..< 3) {
                                Text(NSLocalizedString(self.settings.difficulties[$0], comment: ""))
                            }
                        }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Favorites")) {
                        Button(action: {
                            self.resettingFavoritesAlert = true
                        }) {
                            HStack {
                                Text("Reset Favorites")
                                Image(systemName: "heart.slash")
                            }
                        }
                        .alert(isPresented: $resettingFavoritesAlert) {
                            Alert(title: Text("All favorites will be removed"), message: Text("This cannot be undone!"), primaryButton: .destructive(Text("Reset")) {
                                self.resetFavorites()
                            }, secondaryButton: .cancel())
                        }
                    }
                    Section(header: Text("Resources")) {
                        Button(action: {
                            let url = URL(string: "https://apps.apple.com/us/app/tbaxcerpts/id1511612228")!
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Image("TbaXcerptsIcon")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 29, height: 29)
                                    .mask(RoundedRectangle(cornerRadius: 7.0))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.0)
                                            .stroke(Color.gray, lineWidth: 0.3)
                                    )
                                Text("Download TbaXcerpts")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        Button(action: {
                            let url = URL(string: "https://apps.apple.com/us/app/euphonium-routines/id1511185073")!
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Image("EuphRoutinesIcon")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 29, height: 29)
                                    .mask(RoundedRectangle(cornerRadius: 7.0))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.0)
                                            .stroke(Color.gray, lineWidth: 0.3)
                                    )
                                Text("Download Euphonium Routines")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        Button(action: {
                            let url = URL(string: "https://apps.apple.com/us/app/scale-practice-randomizer/id1496727056")!
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Image("ScalePracticeIcon")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 29, height: 29)
                                    .mask(RoundedRectangle(cornerRadius: 7.0))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 7.0)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                                Text("Download Scale Practice - Randomizer")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        Button(action: {
                            let url = URL(string: "http://www.arsnovapublishing.com")!
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Text("Visit Ars Nova Publishing")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        Button(action: {
                            let url = URL(string: "http://www.bandroomonline.com")!
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Text("Visit Band Room Online")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            
                        }
                    }
                    Section(header: Text("About")) {
                        Text("© 2020 Alexander Burdiss")
                        Button(action: {
                            let url = URL(string: "mailto:aburdiss@gmail.com")!
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Text("Send Feedback")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    /**
     Removes all favorites from the favorites model.
     */
    func resetFavorites() {
        self.favorites.removeAll()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(settingsModel())
    }
}
