//
//  EmptySearchView.swift
//  heirloom
//
//  Created by Kristopher on 8/30/24.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.magnifyingglass")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray).opacity(0.5)
                .padding(.bottom, 10)
            Text("Search Heirloom")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.bottom, 0)
            Text("Find your family's next heirloom.")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    EmptySearchView()
}
