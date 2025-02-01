//
//  SearchBar.swift
//  heirloom
//
//  Created by Kristopher on 8/20/24.
//

import SwiftUI 
struct CustomSearchBar: View {
    @Binding var searchText: String
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial) // Eggshell fill color
                  .frame(height: 40)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "#56666B"))
                    .padding(.leading, 8)
                
                TextField("Search for furniture", text: $searchText)
                
                    .padding(10)
                    .padding(.leading, -6)
            
        
            }
            .padding(.horizontal, 5)
        }
    }
}


struct CustomSearchBar_Previews:PreviewProvider {
    static var previews: some View {
        CustomSearchBar(searchText: .constant(""))
    }
}
