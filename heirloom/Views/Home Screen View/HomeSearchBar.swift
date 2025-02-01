//
//  HomeSearchBar.swift
//  heirloom
//
//  Created by Kristopher on 9/26/24.
//

import SwiftUI

struct HomeSearchBar: View {
    @Binding var showSearchView: Bool
    @AppStorage("selectedTab") var selectedTab: TabName = .home
    
    var body: some View {
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

#Preview {
    HomeSearchBar(showSearchView: .constant(false))
}
