//
//  GameTimerView.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import SwiftUI
import SwiftUIComponents4iOS

struct GameTimerView: View {
    @EnvironmentObject var timerVM: CountdownTimerViewModel
    
    var body: some View {
        CountdownTimerCircleProgressBar(
            lineWidth: 8,
            backForegroundStyle: { Color.gray .opacity(0.3) },
            frontForegroundStyle: { Palette.options1 },
            contentView: {
                Text(TimerStringFormat.secMs.msStr(timerVM.counter))
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Palette.options1)
            }
        )
        .frame(width: 64)
    }
}


// MARK: Preview
private struct TestGameTimerView: View {
    @StateObject var timerVM = CountdownTimerViewModel(
        20.secToMs, timeLeftToNotify: 5.secToMs
    )
    
    var body: some View {
        GameTimerView()
            .environmentObject(timerVM)
    }
}

#Preview { TestGameTimerView() }
