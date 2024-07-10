//
//  UIInt64Ext.swift
//  Darts SwiftUI
//
//  Created by Lev Vlasov on 10.07.2024.
//

import Foundation

extension UInt64 {
    static func nanoseconds(from seconds: Self) -> Self {
        seconds * 1_000_000_000
    }
}
