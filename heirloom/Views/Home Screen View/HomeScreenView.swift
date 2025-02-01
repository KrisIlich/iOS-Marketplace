//
//  HomeScreenView.swift
//  heirloom
//
//  Created by Kristopher on 7/4/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var searchText = ""
    @State private var showCartView = false
    @State private var showSignInView = false
    @State private var showCreateAccountView = false
    @State private var showSearchView = false
    @AppStorage("selectedTab") private var selectedTab: TabName = .home
   
    
    var body: some View {
        VStack(spacing: 0){
            if showSearchView {
                SearchView(showSearchView: $showSearchView)
            } else {
                homeViewHeader
                homeSearchBar
                    .padding(.top, 16)
                    .padding(.bottom, 6)
                    .padding(.horizontal)
                ScrollView {
                    searchShortcutButtons
                    welcomeFrame
                    shoppingList
                }
                .ignoresSafeArea()
            }
        }
            
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showSignInView) {
            SignInView(showSignInView: $showSignInView, showCreateAccountView: $showCreateAccountView)
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showCreateAccountView){
            CreateAccountView(showHomeScreenView: $showCreateAccountView, showSignInView: .constant(false), showCreateAccountView: $showCreateAccountView)
        }
        .fullScreenCover(isPresented: $showCartView){
            CartView(viewModel: CartViewModel(cart: MockData.sampleCart), showCartView: $showCartView)
        }
    }
    
    
    
    var homeViewHeader: some View {
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
                showCartView.toggle()
                print("Cartview toggled? \(showCartView)")
            }) {
                Image(systemName: "cart.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(hex: "#75bba7"))
                
            }
        }
        .frame(height: 35)
        .padding(.horizontal)
    }
    
    
    
    var searchShortcutButtons: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -24){
                ShortcutButton(iconName: "heart", text: "Saved")
                ShortcutButton(iconName: "flame", text: "Hot")
                ShortcutButton(iconName: "bolt", text: "Deals")
                ShortcutButton(iconName: "tag", text: "Offers")
            }
            .padding(.horizontal, (UIScreen.main.bounds.width * 0))
        }
        .frame(height: 50) 
        .padding(.bottom, 20)
    }
    
    var welcomeFrame: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome, Sign in for full customizations")
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(Color(hex: "#56666B"))
                
                
                HStack{
                    Button(action: {
                        withAnimation {
                            showCreateAccountView.toggle()
                        }
                    }) {
                        Text("Create an account")
                            .font(.headline)
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showSignInView.toggle()
                        }
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
        }
    
    var shoppingList: some View {
        VStack {
            RecommendedSellerList(sellers: [
                User(name: "Seller 1"),
                User(name: "Seller 2"),
                User(name: "Seller 3"),
                User(name: "Seller 4"),
                User(name: "Seller 5")
            ])
            CategoriesList(categories: [
                Category(name: "Antiques", iconName: ""),
                Category(name: "Modern", iconName: ""),
                Category(name: "For Stylists", iconName: ""),
                Category(name: "Art Deco", iconName: ""),
                Category(name: "Mid Century", iconName: ""),
                Category(name: "Minimalism", iconName: "")
            ])
            RecommendedSellerList(sellers: [
                User(name: "Seller 1"),
                User(name: "Seller 2"),
                User(name: "Seller 3"),
                User(name: "Seller 4"),
                User(name: "Seller 5")
            ])
        }
    }
    
    var homeSearchBar: some View {
                Button(action: {
                    withAnimation {
                        showSearchView.toggle()
                        selectedTab = .search
                    }
                }) {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.ultraThinMaterial)
                            .frame(height: 40)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(hex: "#56666B"))
                                .padding(.leading, 8)
                            Text("Search for furniture")
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(10)
                                .padding(.leading, -6)
                        }
                    }
                    .padding(.horizontal, 5)
                }
        }
    }
    


struct ShortcutButton: View {
    let buttonWidth: CGFloat = 100
    var iconName: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(Color(hex: "#56666B"))
            Text(text)
                .foregroundColor(Color(hex: "56666B"))
        }
        .padding(5)
        .frame(width: buttonWidth)
        .background(.ultraThinMaterial)
        .cornerRadius(6)
        .padding(.horizontal)

    
    }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
