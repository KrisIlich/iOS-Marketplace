//
//  ContentView.swift
//  heirloom
//
//  Created by Kristopher on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: TabName = .home
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectedTab {
                case .home:
                    HomeScreenView()
                case .profile:
                    AccountDashboardView()
                case .search:
                    SearchView(showSearchView: .constant(false))
                case .notifications:
                    NotificationView()
                case .selling:
                    SellingTabView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FavoritesCartViewModel())
            .environmentObject(ItemViewModel(itemId: UUID()))
    }
}


