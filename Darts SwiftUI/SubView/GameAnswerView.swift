//
//  GameAnswerView.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import SwiftUI

private struct DartsGameAnswerViewConstants {
    static let frameSize: CGFloat = 60
    static let shadowRadius: CGFloat = 4
    static let lineWidth: CGFloat = 4
}

struct GameAnswerView: View {
    private typealias Constants = DartsGameAnswerViewConstants
    
    private let score: Int
    private let color: Color
    private let onAnswered: () -> Void
    
    init(
        score: Int,
        color: Color = Palette.btnSecondary,
        onAnswered: @escaping () -> Void = { }
    ) {
        self.score = score
        self.color = color
        self.onAnswered = onAnswered
    }
    
    var body: some View {
        Button(action: onAnswered) {
            Circle()
                .stroke(lineWidth: Constants.lineWidth)
                .frame(width: Constants.frameSize)
                .shadow(color: color, radius: Constants.shadowRadius)
                .overlay {
                    Text(String(score))
                        .bold()
                }
        }
        .foregroundStyle(color)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
}


// MARK: Preview
#Preview { GameAnswerView(score: 180) }
