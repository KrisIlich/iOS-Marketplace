//
//  ItemDescriptionView.swift
//  heirloom
//
//  Created by Kristopher on 9/19/24.
//

import SwiftUI

struct ItemDescriptionView: View {
    var description: String
    
    var body: some View {
        Button(action: {
            //Description expansion view
        }) {
            VStack(alignment: .leading) {
                    Text("Item Description")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                HStack {
                    Text(description)
                        .lineLimit(3)
                        .padding(.top, 1)
                        .foregroundColor(.black.opacity( 0.7))
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Text("See full description")
                    .foregroundColor(.gray)
                    .underline()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
    }
}

#Preview {
    ItemDescriptionView(description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
}
