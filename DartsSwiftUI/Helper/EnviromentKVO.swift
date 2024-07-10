//
//  EnviromentKVO.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import SwiftUI

extension EnvironmentValues {
    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }
    
    var dartsTargetSize: CGFloat {
        get { self[DartsTargetSizeKey.self] }
        set { self[DartsTargetSizeKey.self] = newValue }
    }
}

private struct MainWindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

private struct DartsTargetSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 350
}
