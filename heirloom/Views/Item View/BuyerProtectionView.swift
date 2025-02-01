//
//  BuyerProtectionView.swift
//  heirloom
//
//  Created by Kristopher on 9/20/24.
//

import SwiftUI

struct BuyerProtectionView: View {
    var body: some View {
        Button(action: {
            // some action
        }) {
            HStack(){
                Image(systemName: "shield.checkerboard")
                    .foregroundColor(.blue)
                Text("Buyer Protection Guarantee")
                    .bold()
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    BuyerProtectionView()
}
