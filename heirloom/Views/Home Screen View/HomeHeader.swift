//
//  HomeHeaderView.swift
//  heirloom
//
//  Created by Kristopher on 9/26/24.
//

import SwiftUI

struct HomeHeader: View {
    @Binding var showFavoritesCartView: Bool
    
    var body: some View {
            HStack {
                if let logoImage = UIImage(named: "logoteal") {
                    Image(uiImage: logoImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 40)
                } else {
                    Text("Logo")
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Button(action: {
                    // action for messages
                }) {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: "#75bba7"))
                    
                }
                
                Button(action: {
                    showFavoritesCartView.toggle()
                    print("Cartview toggled? \(showFavoritesCartView)")
                }) {
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: "#75bba7"))
                    
                }
                
            }
            .frame(height: 35)
            .padding(.horizontal)
    }
}

#Preview {
    HomeHeader(showFavoritesCartView: .constant(false))
}
