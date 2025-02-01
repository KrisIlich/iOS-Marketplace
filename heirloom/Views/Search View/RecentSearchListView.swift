//
//  RecentSearchListView.swift
//  heirloom
//
//  Created by Kristopher on 8/28/24.
//

import SwiftUI

struct RecentSearchListView: View {
    let recentSearches: [RecentSearch] = [
        RecentSearch(searchItem: "Vintage Chair", searchType: "Antique Furniture", date: Date()),
        RecentSearch(searchItem: "Antique Table", searchType: "Antique Furniture", date: Date().addingTimeInterval(-86400)),
        RecentSearch(searchItem: "Retro Lamp", searchType: "Antique Furniture", date: Date().addingTimeInterval(-172800))
    ]
    
    var body: some View {
        List(recentSearches) { search in
            VStack(alignment: .leading) {
                Text(search.searchItem)
                    .font(.headline)
                Text("in " + search.searchType)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(search.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .listRowSeparator(.hidden)
        }
        
        .listStyle(PlainListStyle())
        .background(Color.white)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    RecentSearchListView()
}


