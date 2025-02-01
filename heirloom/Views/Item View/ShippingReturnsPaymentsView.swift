//
//  ShippingReturnsPaymentsView.swift
//  heirloom
//
//  Created by Kristopher on 9/20/24.
//

import SwiftUI

struct ShippingReturnsPaymentsView: View {
    var item: Item
    
    var body: some View {
        Button(action: {
            //buttonaction
        }) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Shipping, Returns, and Payments")
                    .font(.title2.bold())
                    .padding(.bottom, 20)
                Text("Estimated Delivery:")
                    .font(.headline.bold())
                Text("\(formattedDateInterval(item.estimatedDelivery))")
                    .font(.subheadline)
                Text("Returns: Need some sort of blanket return policy. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Payments: Credit Cards, Paypal, Add Payment icons of cards")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
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
    return ShippingReturnsPaymentsView(item: sampleItem)
}
