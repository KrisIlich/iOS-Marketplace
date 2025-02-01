//
//  SavedItemListView.swift
//  heirloom
//
//  Created by Kristopher on 8/28/24.
//

import SwiftUI

struct SavedSearchListView: View {
    let savedSearches: [SavedSearch] = [
        SavedSearch(searchItem: "Classic Sofa", searchType: "Modern Furniture", date: Date()),
        SavedSearch(searchItem: "Wooden Table", searchType: "Modern Furniture", date: Date().addingTimeInterval(-86400))
    ]
    
    var body: some View {
        List(savedSearches) { search in
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
    SavedSearchListView()
}
