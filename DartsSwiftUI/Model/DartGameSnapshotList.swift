//
//  DartGameSnapshotList.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import Foundation

struct DartsGameSnapshotsList: Identifiable {
    let gameId: String
    private(set) var snapshots: [DartsGameSnapshot]
    
    init(_ gameId: String, snapshots: [DartsGameSnapshot] = []) {
        self.gameId = gameId
        self.snapshots = snapshots
    }
    
    var id: String { gameId }
    
    mutating func add(_ snapshot: DartsGameSnapshot) {
        snapshots.append(snapshot)
    }
}

extension DartsGameSnapshotsList: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.gameId     = try container.decode(String.self, forKey: .gameId)
        self.snapshots  = try container.decode([DartsGameSnapshot].self, forKey: .snapshots)
    }

    private enum CodingKeys: String, CodingKey {
        case gameId
        case snapshots
    }
}
