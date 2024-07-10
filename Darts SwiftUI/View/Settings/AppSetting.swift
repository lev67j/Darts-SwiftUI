//
//  AppSetting.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import Foundation

struct AppDefaultSettings {
    static let attemptsCountData = [5, 10, 15, 20]
    static let attempts = attemptsCountData[1]
    
    static let timesForAnswerData = [10_000, 15_000, 20_000, 25_000, 30_000,
                                     35_000, 40_000, 45_000, 50_000, 55_000, 60_000]
    static let timeForAnswer = timesForAnswerData[1]
    
    static func getTimeAnswerIdx(value: Int) -> Int {
        guard let idx = timesForAnswerData.firstIndex(of: value) else { return 1 }
        
        return idx
    }

    /// Function for calculating the number of points for each answer given by the user.
    static func getScoreForSuccesAnswer(timeForAnswer: Int, time: Int) -> Int {
        let xCoef = Float(Self.timeForAnswer) / Float(timeForAnswer)
        let score = Float(Self.timeForAnswer - time)
        
        return Int(xCoef * score / 100)
    }
}

enum AppSettingsKeys: String {
    case attempts
    case timeForAnswer
}

struct AppSettings {
    private typealias Defaults = AppDefaultSettings
    private typealias Keys = AppSettingsKeys
    
    private let userDefaults = UserDefaults.standard
    
    private(set) var attempts: Int
    private(set) var timeForAnswer: Int
    
    init() {
        Self.registerSettings()
        
        attempts        = userDefaults.integer(forKey: Keys.attempts.rawValue)
        timeForAnswer   = userDefaults.integer(forKey: Keys.timeForAnswer.rawValue)
    }
    
    private static func registerSettings() {
        UserDefaults.standard.register(
            defaults: [
                Keys.attempts.rawValue: Defaults.attempts,
                Keys.timeForAnswer.rawValue: Defaults.timeForAnswer
            ]
        )
    }
    
    func save() {
        userDefaults.setValue(attempts, forKey: Keys.attempts.rawValue)
        userDefaults.setValue(timeForAnswer, forKey: Keys.timeForAnswer.rawValue)
    }
    
    mutating func update() {
        attempts        = userDefaults.integer(forKey: Keys.attempts.rawValue)
        timeForAnswer   = userDefaults.integer(forKey: Keys.timeForAnswer.rawValue)
    }
}
