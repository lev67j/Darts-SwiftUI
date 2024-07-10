//
//  GameOverPopup.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import SwiftUI
import SwiftUIComponents4iOS

struct GameOverPopup: View {
    
    private let game: DartsGame
    private let action: () -> Void
    
    init(
        game: DartsGame,
        action: @escaping () -> Void
    ) {
        self.game = game
        self.action = action
    }
    
    var body: some View {
        BluredPopup {
            content
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 256)
    }
    
    private var content: some View {
        VStack(spacing: 16) {
            Text("popupTitle_Results")
            
            Spacer()
            attemptsLabel
            correctLabel
            incorrectLabel
            skippedLabel
            scoreLabel
            timeLabel
            
            Spacer()
            resultLabel
            
            Spacer()
            okButton
        }
        .foregroundStyle(Palette.btnPrimary)
        .font(.title3)
        .padding(32)
    }
    
    private var attemptsLabel: some View {
        HStack {
            Text("label_Attempts")
            Spacer()
            Text("\(game.attempts)")
        }
    }
    
    private var correctLabel: some View {
        HStack {
            Text("label_CorrectAnswers")
            Spacer()
            Text("\(game.correct)")
        }
    }
    
    private var incorrectLabel: some View {
        HStack {
            Text("label_IncorrectAnswers")
            Spacer()
            Text("\(game.misses)")
        }
    }
    
    private var skippedLabel: some View {
        HStack {
            Text("label_SkippedAnswers")
            Spacer()
            Text("\(game.skipped)")
        }
    }
    
    private var scoreLabel: some View {
        HStack {
            Text("label_Score")
            Spacer()
            Text("\(game.score)")
        }
    }
    
    private var timeLabel: some View {
        HStack {
            Text("label_Time")
            Spacer()
            Text("\(TimerStringFormat.secMs.msStr(game.timeSpent)) suffix_Seconds")
        }
    }
    
    private var resultLabel: some View {
        game.isGoodGame
        ? Text("label_GoodResult")
        : Text("label_BadResult")
    }
    
    private var okButton: some View {
        Button(
            action: { action() },
            label: { Text("OK") }
        )
        .foregroundStyle(Palette.btnPrimary)
        .bold()
    }
}


// MARK: Preview
private struct TestGameOverView: View {
    @StateObject var dartsTargetVM = DartsTargetViewModel(frameWidth: 350)
    @State private var popupIsShow = false
    private let btnLabel = "POPUP"
    
    var body: some View {
        ZStack {
            Palette.background
                .ignoresSafeArea()
            
            VStack(spacing: 130) {
                DartsTargetView()
                    .environmentObject(dartsTargetVM)
                
                Button(
                    action: { popupAction() },
                    label: { Text(btnLabel) }
                )
            }
            
            Spacer()
            if popupIsShow {
                GameOverPopup(
                    game: MockData.getDartsGameStats().items[0],
                    action: { popupAction() }
                )
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                .zIndex(1)
            }
        }
    }
    
    private func popupAction() {
        withAnimation {
            popupIsShow.toggle()
        }
    }
}

#Preview { TestGameOverView() }
