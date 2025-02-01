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
                    HomeScreenView(showHomeScreenView: .constant(false))
                case .profile:
                    Image(systemName: "person")
                case .search:
                    Image(systemName: "person")
                case .notifications:
                    Image(systemName: "person")
                case .selling:
                    SellingTabView(showSellingTabView: .constant(false))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabBar()
        }
    }
}


