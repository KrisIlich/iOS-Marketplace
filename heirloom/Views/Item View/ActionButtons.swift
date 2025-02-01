//
//  ActionButtons.swift
//  heirloom
//
//  Created by Kristopher on 9/19/24.
//

import SwiftUI

struct ActionButtons: View {
    let item: Item
    @EnvironmentObject var favoritesCartViewModel: FavoritesCartViewModel
    @State private var showAddToCartFromItemViewAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Button(action:  {
                favoritesCartViewModel.addItem(item)
                showAddToCartFromItemViewAlert = true
            }) {
                HStack {
                    Image(systemName: "heart")
                    Text("Add to Favorites")
                }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action:  {
                // buy it now
            }) {
                Text("Make an Offer")
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
        .alert(isPresented: $showAddToCartFromItemViewAlert) {
            Alert(title: Text("Added to Favorites"), message: Text("\(item.name) has been added to your favorites."), dismissButton: .default(Text("OK")))
        }
        
    }
}


