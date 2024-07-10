//
//  Sound.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 09.07.2024.
//


import AVFoundation

protocol Sound {
    var url: URL? { get }
    
    func getFileName() -> String
    func getFileExtension() -> String
    
    var volume: Float { get set }
    func getNumberOfLoops() -> Int
    func enableRate() -> Bool
    func getRate() -> Float
}

extension Sound {
    var url: URL? {
        Bundle.main.url(forResource: getFileName(), withExtension: getFileExtension())
    }
    
    func getFileExtension() -> String {
        SoundFileExtension.mp3.rawValue
    }
    
    func getNumberOfLoops() -> Int { 0 }
    func enableRate() -> Bool { false }
    func getRate() -> Float { 1 }
}

