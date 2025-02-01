//
//  CartItemView.swift
//  heirloom
//
//  Created by Kristopher on 9/23/24.
//

import SwiftUI

struct CartItemView: View {
    var cartItem: FavoritesCartItem
    @ObservedObject var viewModel: FavoritesCartViewModel
    @State private var showRemoveAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 16) {
                
                ItemThumbnailView(imageUrl: cartItem.item.imageUrls.first)
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(cartItem.item.name)
                        .font(.headline)
                        .lineLimit(2)
                    
                    QuantitySelector(quantity: cartItem.quantity, increaseAction: {
                        viewModel.increaseQuantity(for: cartItem)
                    }, decreaseAction: {
                        if cartItem.quantity > 1 {
                            viewModel.decreaseQuantity(for: cartItem)
                        } else {
                            showRemoveAlert = true
                        }
                    })
                    
                    //price
                    Text("\(cartItem.item.currency) \(Double(truncating: cartItem.item.price as NSNumber), specifier: "%.2f")")
                    
                    // shipping
                    Text("Shipping: \(cartItem.item.currency) \(Double(truncating: cartItem.item.shippingPrice as NSNumber), specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    
                }
            }
            
            .padding(.horizontal)
            
            HStack(alignment: .lastTextBaseline) {
                Spacer()
                
                Button(action: {
                    showRemoveAlert = true
                }) {
                    Text("Remove")
                        
                }
                .buttonStyle(PlainButtonStyle())
                .font(.subheadline)
                .foregroundColor(.gray)
            }
        }
        .padding(12)
        .padding(.vertical, 0)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 2.0, style: .continuous))
        .padding()
        .shadow(color: Color(.gray).opacity(0.3),radius: 7, x: 5, y: 5)
        .alert(isPresented: $showRemoveAlert){
            Alert(
                title: Text("Remove Last Item"),
                message: Text(" Do you want to remove this item from your favorites?"),
                primaryButton: .destructive(Text("Remove")) {
                    viewModel.removeItem(cartItem)
                },
                secondaryButton: .cancel()
                )
        }
    }
}

