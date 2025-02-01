//
//  CartView.swift
//  heirloom
//
//  Created by Kristopher on 9/6/24.
//

import SwiftUI

struct FavoritesCartView: View {
    @EnvironmentObject var viewModel: CartViewModel
    @Binding var showCartView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                CartHeader(showCartView: $showCartView)
                    if viewModel.cart.items.isEmpty {
                        EmptyFavoritesCart()
                    } else {
                        List {
                            ForEach(viewModel.cartItemGrouper.groupedCartItems, id: \.seller.id) { group in
                                Section(header: SellerInfoView(seller: group.seller)
                                    .listRowInsets(EdgeInsets())
                                    .frame(maxWidth: .infinity)
                                ) {
                                    ForEach(group.items) { cartItem in
                                        CartItemView(cartItem: cartItem, viewModel: viewModel)
                                            .listRowInsets(EdgeInsets())
                                    }
                                }
                                .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                if
                    !viewModel.cartItemGrouper.groupedCartItems.isEmpty {
                        CartFooter(viewModel: viewModel)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesCartView(showCartView: .constant(false))
            .environmentObject(CartViewModel())
            .environmentObject(ItemViewModel(itemId: UUID()))
    }
}
