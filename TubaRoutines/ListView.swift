//
//  ListView.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var favorites: Favorites
    
    @State private var resettingFavoritesAlert = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Long Tones")) {
                    NavigationLink(destination: ExerciseDetailView(image: "1")) {
                        Text("1")
                        if self.favorites.contains("1") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "2")) {
                        Text("2")
                        if self.favorites.contains("2") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "3")) {
                        Text("3")
                        if self.favorites.contains("3") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "4")) {
                        Text("4")
                        if self.favorites.contains("4") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "5")) {
                        Text("5")
                        if self.favorites.contains("5") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "6")) {
                        Text("6")
                        if self.favorites.contains("6") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "7")) {
                        Text("7")
                        if self.favorites.contains("7") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Slow Lip Slurs")) {
                    NavigationLink(destination: ExerciseDetailView(image: "10")) {
                        Text("10")
                        if self.favorites.contains("10") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "11")) {
                        Text("11")
                        if self.favorites.contains("11") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "12")) {
                        Text("12")
                        if self.favorites.contains("12") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "13")) {
                        Text("13")
                        if self.favorites.contains("13") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "14")) {
                        Text("14")
                        if self.favorites.contains("14") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "15")) {
                        Text("15")
                        if self.favorites.contains("15") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "16")) {
                        Text("16")
                        if self.favorites.contains("16") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "17")) {
                        Text("17")
                        if self.favorites.contains("17") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "18")) {
                        Text("18")
                        if self.favorites.contains("18") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "19")) {
                        Text("19")
                        if self.favorites.contains("19") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Fast Lip Slurs")) {
                    NavigationLink(destination: ExerciseDetailView(image: "21")) {
                        Text("21")
                        if self.favorites.contains("21") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "22")) {
                        Text("22")
                        if self.favorites.contains("22") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "23")) {
                        Text("23")
                        if self.favorites.contains("23") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "24")) {
                        Text("24")
                        if self.favorites.contains("24") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "25")) {
                        Text("25")
                        if self.favorites.contains("25") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "26")) {
                        Text("26")
                        if self.favorites.contains("26") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "27")) {
                        Text("27")
                        if self.favorites.contains("27") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Single Note Articulation")) {
                    NavigationLink(destination: ExerciseDetailView(image: "30")) {
                        Text("30")
                        if self.favorites.contains("30") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "31")) {
                        Text("31")
                        if self.favorites.contains("31") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "32")) {
                        Text("32")
                        if self.favorites.contains("32") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "33")) {
                        Text("33")
                        if self.favorites.contains("33") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "34")) {
                        Text("34")
                        if self.favorites.contains("34") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "35")) {
                        Text("35")
                        if self.favorites.contains("35") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "36")) {
                        Text("36")
                        if self.favorites.contains("36") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "37")) {
                        Text("37")
                        if self.favorites.contains("37") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "38")) {
                        Text("38")
                        if self.favorites.contains("38") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Moving Note Articulation")) {
                    NavigationLink(destination: ExerciseDetailView(image: "40")) {
                        Text("40")
                        if self.favorites.contains("40") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "41")) {
                        Text("41")
                        if self.favorites.contains("41") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "42")) {
                        Text("42")
                        if self.favorites.contains("42") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "43")) {
                        Text("43")
                        if self.favorites.contains("43") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "44")) {
                        Text("44")
                        if self.favorites.contains("44") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "45")) {
                        Text("45")
                        if self.favorites.contains("45") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "46")) {
                        Text("46")
                        if self.favorites.contains("46") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Scales")) {
                    Section {
                        NavigationLink(destination: ExerciseDetailView(image: "50")) {
                            Text("50 (B♭ Major)")
                            if self.favorites.contains("50") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "51")) {
                            Text("51 (B Major)")
                            if self.favorites.contains("51") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "52")) {
                            Text("52 (C Major)")
                            if self.favorites.contains("52") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "53")) {
                            Text("53 (D♭ Major)")
                            if self.favorites.contains("53") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "54")) {
                            Text("54 (D Major)")
                            if self.favorites.contains("54") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "55")) {
                            Text("55 (E♭ Major)")
                            if self.favorites.contains("55") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "56")) {
                            Text("56 (E Major)")
                            if self.favorites.contains("56") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "57")) {
                            Text("57 (F Major)")
                            if self.favorites.contains("57") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "58")) {
                            Text("58 (G♭ Major)")
                            if self.favorites.contains("58") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "59")) {
                            Text("59 (G Major)")
                            if self.favorites.contains("59") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Section {
                        NavigationLink(destination: ExerciseDetailView(image: "60")) {
                            Text("60 (A♭ Major)")
                            if self.favorites.contains("60") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                        NavigationLink(destination: ExerciseDetailView(image: "61")) {
                            Text("61 (A Major)")
                            if self.favorites.contains("61") {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibility(label: Text("This is a favorite exercise"))
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                
                Section(header: Text("High Range")) {
                    NavigationLink(destination: ExerciseDetailView(image: "70")) {
                        Text("70")
                        if self.favorites.contains("70") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "71")) {
                        Text("71")
                        if self.favorites.contains("71") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "72")) {
                        Text("72")
                        if self.favorites.contains("72") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "73")) {
                        Text("73")
                        if self.favorites.contains("73") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "74")) {
                        Text("74")
                        if self.favorites.contains("74") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "75")) {
                        Text("75")
                        if self.favorites.contains("75") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "76")) {
                        Text("76")
                        if self.favorites.contains("76") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "77")) {
                        Text("77")
                        if self.favorites.contains("77") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "78")) {
                        Text("78")
                        if self.favorites.contains("78") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                Section(header: Text("Low Range")) {
                    NavigationLink(destination: ExerciseDetailView(image: "80")) {
                        Text("80")
                        if self.favorites.contains("80") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "81")) {
                        Text("81")
                        if self.favorites.contains("81") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "82")) {
                        Text("82")
                        if self.favorites.contains("82") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "83")) {
                        Text("83")
                        if self.favorites.contains("83") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "84")) {
                        Text("84")
                        if self.favorites.contains("84") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "85")) {
                        Text("85")
                        if self.favorites.contains("85") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "86")) {
                        Text("86")
                        if self.favorites.contains("86") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                    NavigationLink(destination: ExerciseDetailView(image: "87")) {
                        Text("87")
                        if self.favorites.contains("87") {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibility(label: Text("This is a favorite exercise"))
                                .foregroundColor(.red)
                        }
                    }
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("All Exercises")
            .navigationBarItems(trailing: Button(action: {
                self.resettingFavoritesAlert = true
            }) {
                Text("Reset")
                Image(systemName: "heart.slash")
            }
            .alert(isPresented: $resettingFavoritesAlert) {
                Alert(title: Text("All favorites will be removed"), message: Text("This cannot be undone!"), primaryButton: .destructive(Text("Reset")) {
                    self.resetFavorites()
                    }, secondaryButton: .cancel())
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func resetFavorites() {
        self.favorites.removeAll()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(Favorites())
    }
}
