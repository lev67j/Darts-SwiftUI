//
//  DartGameSnapshot.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import Foundation

struct DartsGameSnapshot: Identifiable {
    let id: Int
    let expected: Int
    let actual: Int
    let answers: [Int]
    let darts: [Dart]
    let time: Int
    let score: Int
    let isMissed: Bool
}

extension DartsGameSnapshot: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.expected = try container.decode(Int.self, forKey: .expected)
        self.actual = try container.decode(Int.self, forKey: .actual)
        self.answers = try container.decode([Int].self, forKey: .answers)
        self.darts = try container.decode([Dart].self, forKey: .darts)
        self.time = try container.decode(Int.self, forKey: .time)
        self.score = try container.decode(Int.self, forKey: .score)
        self.isMissed = try container.decode(Bool.self, forKey: .isMissed)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case expected
        case actual
        case answers
        case darts
        case time
        case score
        case isMissed
    }
}
