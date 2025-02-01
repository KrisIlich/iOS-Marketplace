//
//  CartHeader.swift
//  heirloom
//
//  Created by Kristopher on 9/24/24.
//

import SwiftUI

struct FavoritesCartHeader: View {
    @Binding var showFavoritesCartView: Bool
    
    var body: some View {
        HStack {

            Text("Cart")
                .font(.largeTitle)
                .foregroundColor(Color(hex: "56666B"))
                .bold()

            Spacer()

            Button(action: {
                withAnimation {
                    showFavoritesCartView.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color(hex: "#56666B"))
                    .frame(width: 35, height: 35)
                    .background(.ultraThinMaterial)
                    .cornerRadius(11)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    FavoritesCartHeader(showFavoritesCartView: .constant(false))
}
