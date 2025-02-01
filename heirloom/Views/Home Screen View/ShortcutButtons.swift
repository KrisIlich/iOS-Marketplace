//
//  ShortcutButtons.swift
//  heirloom
//
//  Created by Kristopher on 9/26/24.
//

import SwiftUI

struct ShortcutButtons: View {
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -24){
                    ShortcutButton(iconName: "heart", text: "Saved")
                    ShortcutButton(iconName: "flame", text: "Hot")
                    ShortcutButton(iconName: "bolt", text: "Deals")
                    ShortcutButton(iconName: "tag", text: "Offers")
                }
                .padding(.horizontal, (UIScreen.main.bounds.width * 0))
            }
            .frame(height: 40)
            .padding(.bottom, 2)
    }
    
    
    struct ShortcutButton: View {
        let buttonWidth: CGFloat = 100
        var iconName: String
        var text: String
        
        var body: some View {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(Color(hex: "#56666B"))
                Text(text)
                    .foregroundColor(Color(hex: "56666B"))
            }
            .padding(5)
            .frame(width: buttonWidth)
            .background(.ultraThinMaterial)
            .cornerRadius(6)
            .padding(.horizontal)

        
        }
    }
}

#Preview {
    ShortcutButtons()
}
