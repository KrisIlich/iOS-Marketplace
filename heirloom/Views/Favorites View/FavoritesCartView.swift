//
//  CartView.swift
//  heirloom
//
//  Created by Kristopher on 9/6/24.
//

import SwiftUI

struct FavoritesCartView: View {
    @EnvironmentObject var viewModel: FavoritesCartViewModel
    @Binding var showCartView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                FavoritesCartHeader(showFavoritesCartView: $showCartView)
                    if viewModel.favoritesCart.items.isEmpty {
                        EmptyFavoritesCart()
                    } else {
                        List {
                            ForEach(viewModel.favoritesCartItemGrouper.groupedFavoritesCartItems, id: \.seller.id) { group in
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
                if !viewModel.favoritesCartItemGrouper.groupedFavoritesCartItems.isEmpty {
                        FavoritesCartFooter(viewModel: viewModel)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesCartView(showCartView: .constant(false))
            .environmentObject(FavoritesCartViewModel())
            .environmentObject(ItemViewModel(itemId: UUID()))
    }
}
