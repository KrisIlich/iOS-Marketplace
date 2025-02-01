//
//  AboutThisItemView.swift
//  heirloom
//
//  Created by Kristopher on 9/20/24.
//

import SwiftUI

struct AboutThisItemView: View {
    var item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("About this item")
                .font(.title2.bold())
                .padding(.bottom, 20)
            ForEach(item.details.sorted(by: >), id: \.key) { key, value in
                HStack {
                    Text("\(key):")
                        .fontWeight(.bold)
                    Text(value)
                    Spacer()
                }
            }
            HStack {
                Text("Item Number:")
                    .fontWeight(.bold)
                Text(item.itemNumber)
            }
            HStack {
                Text("UPC:")
                    .fontWeight(.bold)
                Text(item.upc)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    let sampleSeller = User(
        id: UUID(),
        name: "Chester Walker",
        profileImageURL: nil,
        joinDate: Date(),
        feedbackPercentage: 99.5,
        reviewsCount: 150
    )
    
    let estimatedDelivery = DateInterval(
        start: Date().addingTimeInterval(5 * 86400),
        end: Date().addingTimeInterval(10 * 86400)
        )
    
    let sampleItem = Item(
        id: UUID(),
        name: "Sample Item",
        description: "This is a sample item for preview purposes",
        categoryID: UUID(),
        price: 99.99,
        currency: "USD",
        imageUrls: [],
        seller: sampleSeller,
        condition: "New",
        shippingPrice: 9.99,
        estimatedDelivery: estimatedDelivery,
        watchersCount: 5,
        itemNumber: "123456789",
        quantity: 1,
        upc: "0987654321",
        details: ["Material": "Sample Material", "Color": "Red"]
        )
    return AboutThisItemView(item: sampleItem)
}
