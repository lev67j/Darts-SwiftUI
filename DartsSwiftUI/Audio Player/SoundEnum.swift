//
//  SoundEnum.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 09.07.2024.
//

import Foundation

enum SoundFileExtension: String {
    case mp3
}

enum SoundEnum {
    case userTap
    case timerEnd
    case dartsTargetRotation
    case gameGoodResult
    case gameBadResult
    
    var sound: Sound {
        switch self {
            case .userTap:
                return UserTapSound()
            case .timerEnd:
                return TimerEndSound()
            case .dartsTargetRotation:
                return DartsTargetRotationSound()
            case .gameBadResult:
                return GameBadResultSound()
            case .gameGoodResult:
                return GameGoodResultSound()
        }
    }
}
