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
            if let imageUrl = seller.profileImageURL {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
    
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
    }
}

#Preview {
    SellerInfoView(seller: User(name: "Kris' Antique Shop", feedbackPercentage: 99.5, reviewsCount: 19))
}
