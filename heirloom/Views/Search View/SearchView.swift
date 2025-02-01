//
//  SearchView.swift
//  heirloom
//
//  Created by Kristopher on 8/20/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedSearchTab: SearchTab = .recent
    @State private var showFavoritesCartView = false
    @State private var underlineWidth: CGFloat = 0
    @State private var underlineXOffset: CGFloat = 0
    @Binding var showSearchView: Bool
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 0) {
            HStack {
                CustomSearchBar(searchText: $searchText)
                    .padding(.trailing, 14)
                Button(action: {
                    showFavoritesCartView.toggle()
                }) {
                    
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: "#75bba7"))
                }
            }
            .frame(height: 35)
            .padding(.horizontal)
            
            HStack {
                tabButton(text: "Recent", tab: .recent)
                tabButton(text: "Saved", tab: .saved)
            }
            .padding(.top, 8)
            .padding(.bottom, 45)
            .overlay(
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: underlineWidth, height: 2)
                    .offset(x: underlineXOffset)
                    .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.2), value: underlineXOffset)
            )
            
            if selectedSearchTab == .recent {
                RecentSearchListView()
            } else if selectedSearchTab == .saved {
                SavedSearchListView()
            } 
            //add other condition for empty lists showing emptySearchView
            
            
            Spacer()
        }
       .fullScreenCover(isPresented: $showFavoritesCartView){
           FavoritesCartView(showCartView: $showFavoritesCartView)
       }
    }
    
    func tabButton(text: String, tab: SearchTab) -> some View {
        Button(action: {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.75, blendDuration: 0.2)) {
                selectedSearchTab = tab
            }
        }) {
            GeometryReader { proxy in
                Text(text)
                    .font(.system(size: 16, design: .rounded))
                    .fontWeight(selectedSearchTab == tab ? .semibold : .regular)
                    .foregroundColor(selectedSearchTab == tab ? .primary : .secondary)
                    .frame(maxWidth: .infinity)
                    .onAppear {
                        if selectedSearchTab == tab {
                            underlineWidth = 65
                            underlineXOffset = proxy.frame(in: .global).midX - proxy.size.width - 4
                        }
                    }
                    .onChange(of: selectedSearchTab) {
                        if selectedSearchTab == tab {
                            withAnimation {
                                underlineWidth = 65
                                underlineXOffset = proxy.frame(in: .global).midX - proxy.size.width - 4
                            }
                        }
                    }
            }
            .frame(height: 10)
        }
    }
}

enum SearchTab {
    case recent
    case saved
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(showSearchView: .constant(false))
            .environmentObject(FavoritesCartViewModel())
            .environmentObject(ItemViewModel(itemId: UUID()))
    }
}
