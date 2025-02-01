//
//  ActionButtons.swift
//  heirloom
//
//  Created by Kristopher on 9/19/24.
//

import SwiftUI

struct ActionButtons: View {
    var body: some View {
        VStack(spacing: 10) {
            Button(action:  {
                // buy it now
            }) {
                Text("Buy It Now")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            Button(action:  {
                // add to cart
            }) {
                Text("Add to Cart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .cornerRadius(8)
                    .overlay (
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue)
                    )
            }
            Button(action:  {
                // add to watchlist
            }) {
                HStack {
                    Image(systemName: "heart")
                    Text("Add to Watchlist")
                }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .cornerRadius(8)
                    .overlay (
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue)
                    )
                
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    ActionButtons()
}
