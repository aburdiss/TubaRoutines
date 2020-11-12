//
//  Model.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import Foundation

/**
Array of all long tone exercises in the app
*/
let longTones: [String] = ["1", "2", "3", "4", "5", "6", "7"]

/**
Array of all slow lip slur exercises in the app
*/
let slowLipSlurs: [String] = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]

/**
Array of all fast lip slur exercises in the app
*/
let fastLipSlurs: [String] = ["21", "22", "23", "24", "25", "26", "27"]

/**
Array of all static articulation exercises in the app
*/
let staticArticulation: [String] = ["30", "31", "32", "33", "34", "35", "36", "37", "38"]

/**
Array of all variable articulation exercises in the app
*/
let variableArticulation: [String] = ["40", "41", "42", "43", "44", "45", "46"]

/**
Array of all scales exercises in the app
*/
let scales: [String] = ["50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61"]

/**
Array of all high range exercises in the app
*/
let highRange: [String] = ["70", "71", "72", "73", "74", "75", "76", "77", "78"]

/**
Array of all low range exercises in the app
*/
let lowRange: [String] = ["80", "81", "82", "83", "84", "85", "86", "87"]

/**
 Array of all of the exercises in the app
 */
let allExercises: [String] = longTones + slowLipSlurs + fastLipSlurs + staticArticulation + variableArticulation + scales + highRange + lowRange

/**
The logic responsible for setting and retrieving user defined settings in local memory. Settings persist between app termination and launch.
*/
class Settings: ObservableObject {
    /**
    The different difficulty names to be shown on the difficulty selection picker.
    */
    var difficulties = ["Short", "Medium", "Long"]
    
    /**
    User selected difficulty of the routine
    */
    @Published var selectedDifficulty: Int = UserDefaults.standard.integer(forKey: "Difficulty") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.selectedDifficulty, forKey: "Difficulty")
        }
    }
    
    /**
    User selected choice of whether the routine will include long tones
    */
    @Published var longTonesToggle: Bool = UserDefaults.standard.bool(forKey: "LongTones") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.longTonesToggle, forKey: "LongTones")
        }
    }
    
    /**
    User selected choice of whether the routine will include slow lip slurs
    */
    @Published var slowLipSlursToggle: Bool = UserDefaults.standard.bool(forKey: "SlowLipSlurs") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.slowLipSlursToggle, forKey: "SlowLipSlurs")
        }
    }
    
    /**
    User selected choice of whether the routine will include fast lip slurs
    */
    @Published var fastLipSlursToggle: Bool = UserDefaults.standard.bool(forKey: "FastLipSlurs"){
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.fastLipSlursToggle, forKey: "FastLipSlurs")
        }
    }
    
    /**
    User selected choice of whether the routine will include static articulation
    */
    @Published var staticArticulationToggle: Bool = UserDefaults.standard.bool(forKey: "StaticArticulation") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.staticArticulationToggle, forKey: "StaticArticulation")
        }
    }
    
    /**
    User selected choice of whether the routine will include variable articulation
    */
    @Published var variableArticulationToggle: Bool = UserDefaults.standard.bool(forKey: "VariableArticulation") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.variableArticulationToggle, forKey: "VariableArticulation")
        }
    }
    
    /**
    User selected choice of whether the routine will include major scales
    */
    @Published var majorScalesToggle: Bool = UserDefaults.standard.bool(forKey: "MajorScales") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.majorScalesToggle, forKey: "MajorScales")
        }
    }
    
    /**
    User selected choice of whether the routine will include high range
    */
    @Published var highRangeToggle: Bool = UserDefaults.standard.bool(forKey: "HighRange") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.highRangeToggle, forKey: "HighRange")
        }
    }
    
    /**
    User selected choice of whether the routine will include low range
    */
    @Published var lowRangeToggle: Bool = UserDefaults.standard.bool(forKey: "LowRange") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.lowRangeToggle, forKey: "LowRange")
        }
    }
}

/**
 Saves user selected favorite exercises to persistent memory, and allows for the addition and removal of new favorites.
 adapted from an article on `Hacking With Swift`
 */
class Favorites: ObservableObject {
    // the actual images the user selected as a favorite
    private var images: [String]

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        // load saved data
        self.images = UserDefaults.standard.stringArray(forKey: saveKey) ?? [String]()
    }

    // returns true if set contains favorite
    func contains(_ image: String) -> Bool {
        images.contains(image)
    }

    // adds the favorite to set, updates all views, and saves the change
    func add(_ image: String) {
        objectWillChange.send()
        images.append(image)
        save()
    }

    // removes the favorite from set, updates all views, and saves change
    func remove(_ image: String) {
        objectWillChange.send()
        var counter = 0
        var removeIndex = 0
        while counter < images.count {
            if images[counter] == image {
                removeIndex = counter
            }
            counter += 1
        }
        images.remove(at: removeIndex)
        save()
    }
    
    func removeAll() {
        objectWillChange.send()
        images.removeAll()
        save()
    }

    func save() {
        // write out data
        UserDefaults.standard.set(self.images, forKey: saveKey)
    }
    
    func isEmpty() -> Bool {
        return self.images.count == 0
    }
    
    func getAllFavorites() -> [String] {
        return self.images
    }
}

struct CustomRoutine: Equatable, Identifiable, Codable {
    var id = UUID()
    var name: String
    var routine: [String]
}

class CustomRoutines: ObservableObject {
    // the actual routines the user created
    @Published var routines: [CustomRoutine] = []
    
    // the key we're using to read/write in UserDefaults
    private let saveKey = "Routines"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([CustomRoutine].self, from: data) {
                self.routines = decoded
                return
            }
        }
        
        self.routines = []
    }

    // returns true if set contains favorite
    func contains(_ routine: CustomRoutine) -> Bool {
        routines.contains(routine)
    }

    // adds the favorite to set, updates all views, and saves the change
    func add(_ routine: CustomRoutine) {
        objectWillChange.send()
        routines.append(routine)
        save()
    }

    // removes the favorite from set, updates all views, and saves change
    func remove(_ routine: CustomRoutine) {
        objectWillChange.send()
        var counter = 0
        var removeIndex = 0
        while counter < routines.count {
            if routines[counter] == routine {
                removeIndex = counter
            }
            counter += 1
        }
        routines.remove(at: removeIndex)
        save()
    }
    
    func removeAll() {
        objectWillChange.send()
        routines.removeAll()
        save()
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(routines) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func isEmpty() -> Bool {
        return self.routines.count == 0
    }
    
    func getAllRoutines() -> [CustomRoutine] {
        return self.routines
    }
}

/**
 Overrides default yellow color with custom color.
 */
extension Color {
    static let yellow = Color("AccentColor")
}
