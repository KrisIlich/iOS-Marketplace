//
//  PriceAndShippingView.swift
//  heirloom
//
//  Created by Kristopher on 9/22/24.
//

import SwiftUI

struct PriceAndShippingView: View {
    var item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .lastTextBaseline){
            Text("\(item.currency) \(Double(truncating: item.price as NSNumber), specifier: "%.2f")")
                .font(.title)
                .fontWeight(.bold)
            Text("Shipping: \(item.currency) \(Double(truncating: item.shippingPrice as NSNumber), specifier: "%.2f")")
                .foregroundColor(.gray)
                .padding(.bottom, 8)
        }
            Text("Estimated Delivery: \(formattedDateInterval(item.estimatedDelivery))")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
        
        func formattedDateInterval(_ interval: DateInterval) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            let start = formatter.string(from: interval.start)
            let end = formatter.string(from: interval.end)
            return "\(start) - \(end)"
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
        categoryId: UUID(),
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
    
    return PriceAndShippingView(item: sampleItem)
}
