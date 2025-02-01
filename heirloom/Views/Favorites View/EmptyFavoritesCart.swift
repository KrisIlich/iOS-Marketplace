//
//  EmptyCart.swift
//  heirloom
//
//  Created by Kristopher on 9/25/24.
//

import SwiftUI

struct EmptyFavoritesCart: View {
    var body: some View {
VStack {
            Spacer()
            Image(systemName: "cart.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            Text("Your cart is empty.")
                .font(.title2)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

#Preview {
    EmptyFavoritesCart()
}
