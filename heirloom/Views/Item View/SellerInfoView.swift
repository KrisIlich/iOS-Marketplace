//
//  SellerInfoView.swift
//  heirloom
//
//  Created by Kristopher on 9/18/24.
//

import SwiftUI

struct SellerInfoView: View {
    var seller: User
    
    var body: some View {
        HStack {
            AsyncImage(url: seller.profileImageURL) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                } else {
                    ProgressView()
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(seller.name)
                    .font(.headline)
                Text("\(String(format: "%.1f", seller.feedbackPercentage))% Rating (\(seller.reviewsCount) reviews)")
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                //message seller action
            }) {
                Image(systemName: "message")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

#Preview {
    SellerInfoView(seller: User(name: "Kris' Antique Shop", feedbackPercentage: 99.5, reviewsCount: 19))
}
