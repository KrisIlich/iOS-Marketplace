//
//  Styles.swift
//  heirloom
//
//  Created by Kristopher on 8/14/24.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius = 32.0
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle() -> some View {
        modifier(StrokeStyle())
    }
}
