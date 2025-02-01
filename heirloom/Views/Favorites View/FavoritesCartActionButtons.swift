//
//  CartActionButtons.swift
//  heirloom
//
//  Created by Kristopher on 9/24/24.
//

import SwiftUI

struct FavoritesCartActionButtons: View {
        var body: some View {
            VStack(spacing: 10) {
                Button(action:  {
                    // buy it now
                }) {
                    Text("Confirm Purchase")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }

    #Preview {
       FavoritesCartActionButtons()
    }
