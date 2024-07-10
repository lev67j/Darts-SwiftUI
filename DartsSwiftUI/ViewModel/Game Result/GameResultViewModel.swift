//
//  GameResultViewModel.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import SwiftUI

final class GamesResultsViewModel: ObservableObject {
    @Published private(set) var model = GamesResultsViewModel.getModel()
    
    func refresh() {
        model = Self.getModel()
        sort()
    }
    
    private static func getModel() -> DartsGameStats {
        if isPreview {
            return MockData.generateGameStats(n: 5)
        } else {
            return JsonCache.loadDartsGameStats(from: AppConstants.statsJsonName)
        }
    }
    
    func getGame(_ idx: String) -> DartsGame? {
        model.items.first { $0.id == idx }
    }
    
    func sort() { model.sortByScore() }
}
