//
//  HomeScreenView.swift
//  heirloom
//
//  Created by Kristopher on 7/4/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var searchText = ""
    @State private var showFavoritesCartView = false
    @State private var showSignInView = false
    @State private var showCreateAccountView = false
    @State private var showSearchView = false
    @AppStorage("selectedTab") private var selectedTab: TabName = .home
    @EnvironmentObject var cartViewModel: FavoritesCartViewModel
    @EnvironmentObject var itemViewModel: ItemViewModel
   

    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                if showSearchView {
                    SearchView(showSearchView: $showSearchView)
                } else {
                    HomeHeader(showFavoritesCartView: $showFavoritesCartView)
                    HomeSearchBar(showSearchView: $showSearchView)
                        .padding(.top, 16)
                        .padding(.bottom, 6)
                        .padding(.horizontal)
                    ShortcutButtons()
                    ScrollView {
                        WelcomeFrame(showCreateAccountView: $showCreateAccountView, showSignInView: $showSignInView)
                        RecommendedSellerList(sellers: [
                            User(name: "Seller 1", feedbackPercentage: 99.3, reviewsCount: 343),
                            User(name: "Seller 2", feedbackPercentage: 83.3, reviewsCount: 234),
                            User(name: "Seller 3", feedbackPercentage: 91.0, reviewsCount: 541),
                            User(name: "Seller 4", feedbackPercentage: 92.4, reviewsCount: 23),
                        ])
                        CategoriesList(categories: [
                            Category(name: "Antiques", iconName: ""),
                            Category(name: "Modern", iconName: ""),
                            Category(name: "For Stylists", iconName: ""),
                            Category(name: "Art Deco", iconName: ""),
                            Category(name: "Mid Century", iconName: ""),
                            Category(name: "Minimalism", iconName: "")
                        ])
                        ShoppingList()
                    }
                    .ignoresSafeArea()
                }
            }
                
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showSignInView) {
                SignInView(showSignInView: $showSignInView, showCreateAccountView: $showCreateAccountView)
                    .environmentObject(FavoritesCartViewModel())
                    .environmentObject(ItemViewModel(itemId: UUID()))
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showCreateAccountView){
                CreateAccountView(showHomeScreenView: $showCreateAccountView, showSignInView: .constant(false), showCreateAccountView: $showCreateAccountView)
                    .environmentObject(FavoritesCartViewModel())
                    .environmentObject(ItemViewModel(itemId: UUID()))
            }
            .fullScreenCover(isPresented: $showFavoritesCartView){
                FavoritesCartView(showCartView: $showFavoritesCartView)
                    .environmentObject(FavoritesCartViewModel())
                    .environmentObject(ItemViewModel(itemId: UUID()))
        }
        }
    }
    
    }
    


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(FavoritesCartViewModel())
            .environmentObject(ItemViewModel(itemId: UUID()))
    }
}
