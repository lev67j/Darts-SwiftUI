//
//  DartSector.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import Foundation

enum DartsSectorArea: String, Codable {
    case points
    case wire
    case outOfPoints
    case bullEye
    case points25
}

struct DartsSector {
    let sectorIdx: Int
    
    let points: Int
    let xScore: Int
    let area: DartsSectorArea
    
    init(_ area: DartsSectorArea) {
        self.area = area
        self.sectorIdx = 0

        switch area {
            case .bullEye:
                points = DartsConstants.bullEyePoints
                xScore = DartsConstants.x1Score
            case .points25:
                points = DartsConstants.points25
                xScore = DartsConstants.x1Score
            default:
                if area == .points { assertionFailure("Logic error!") }
                points = .zero
                xScore = .zero
        }
    }
    
    init(_ sectorIdx: Int, points: Int, xScore: Int = DartsConstants.x1Score) {
        self.sectorIdx = sectorIdx
        self.points = points
        self.xScore = xScore
        self.area = .points
    }
    
    var description: String {
        points > .zero ? "\(points)x\(xScore)" : "Miss"
    }
}

extension DartsSector: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.sectorIdx  = try container.decode(Int.self, forKey: .sectorIdx)
        self.points     = try container.decode(Int.self, forKey: .points)
        self.xScore     = try container.decode(Int.self, forKey: .xScore)
        self.area       = try container.decode(DartsSectorArea.self, forKey: .area)
    }

    private enum CodingKeys: String, CodingKey {
        case sectorIdx
        case points
        case xScore
        case area
    }
}
