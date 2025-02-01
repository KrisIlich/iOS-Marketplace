//
//  QuantitySelector.swift
//  heirloom
//
//  Created by Kristopher on 9/23/24.
//

import SwiftUI

struct QuantitySelector: View {
    var quantity: Int
    var increaseAction: () -> Void
    var decreaseAction: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            Text("Quantity:")
            HStack {
                Button(action: decreaseAction) {
                    if quantity == 1 {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(quantity > 1 ? .blue : Color(hex: "#FF7f7f").opacity(0.6))
                    } else {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(quantity > 1 ? .blue : .blue)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                
                Text("\(quantity)")
                    .frame(width: 30)
                    .multilineTextAlignment(.center)
                
                Button(action: increaseAction) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .font(.subheadline)
    }
}


