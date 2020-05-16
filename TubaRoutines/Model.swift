//
//  Model.swift
//  TubaRoutines
//
//  Created by Alex Burdiss on 5/15/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import Foundation

let longTones: [String] = ["1", "2", "3", "4", "5", "6", "7"]
let slowLipSlurs: [String] = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19"]
let fastLipSlurs: [String] = ["21", "22", "23", "24", "25", "26", "27"]
let staticArticulation: [String] = ["30", "31", "32", "33", "34", "35", "36", "37", "38"]
let variableArticulation: [String] = ["40", "41", "42", "43", "44", "45", "46"]
let scales: [String] = ["50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61"]
let highRange: [String] = ["70", "71", "72", "73", "74", "75", "76", "77", "78"]
let lowRange: [String] = ["80", "81", "82", "83", "84", "85", "86", "87"]


class settingsModel: ObservableObject {
    var difficulties = ["Short", "Medium", "Long"]
    
    @Published var selectedDifficulty: Int = UserDefaults.standard.integer(forKey: "Difficulty") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.selectedDifficulty, forKey: "Difficulty")
        }
    }
    
    @Published var longTonesToggle: Bool = UserDefaults.standard.bool(forKey: "LongTones") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.longTonesToggle, forKey: "LongTones")
        }
    }
    
    @Published var slowLipSlursToggle: Bool = UserDefaults.standard.bool(forKey: "SlowLipSlurs") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.slowLipSlursToggle, forKey: "SlowLipSlurs")
        }
    }
    
    @Published var fastLipSlursToggle: Bool = UserDefaults.standard.bool(forKey: "FastLipSlurs"){
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.fastLipSlursToggle, forKey: "FastLipSlurs")
        }
    }
    
    @Published var staticArticulationToggle: Bool = UserDefaults.standard.bool(forKey: "StaticArticulation") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.staticArticulationToggle, forKey: "StaticArticulation")
        }
    }
    
    @Published var variableArticulationToggle: Bool = UserDefaults.standard.bool(forKey: "VariableArticulation") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.variableArticulationToggle, forKey: "VariableArticulation")
        }
    }
    
    @Published var majorScalesToggle: Bool = UserDefaults.standard.bool(forKey: "MajorScales") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.majorScalesToggle, forKey: "MajorScales")
        }
    }
    
    @Published var highRangeToggle: Bool = UserDefaults.standard.bool(forKey: "HighRange") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.highRangeToggle, forKey: "HighRange")
        }
    }
    
    @Published var lowRangeToggle: Bool = UserDefaults.standard.bool(forKey: "LowRange") {
        didSet {
            objectWillChange.send()
            UserDefaults.standard.set(self.lowRangeToggle, forKey: "LowRange")
        }
    }
}

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var images: [String]

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        // load our saved data
        self.images = UserDefaults.standard.stringArray(forKey: saveKey) ?? [String]()
    }

    // returns true if our set contains this resort
    func contains(_ image: String) -> Bool {
        images.contains(image)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ image: String) {
        objectWillChange.send()
        images.append(image)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
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
        // write out our data
        UserDefaults.standard.set(self.images, forKey: saveKey)
    }
}
