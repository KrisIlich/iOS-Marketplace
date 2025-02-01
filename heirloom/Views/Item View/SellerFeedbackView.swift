import SwiftUI

struct SellerFeedbackView: View {
    var seller: User

    var body: some View {
        VStack(alignment: .leading) {
            Text("Seller's Feedback")
                .font(.headline)
                .padding(.top, 8)
                .padding(.horizontal)
            HStack {
                Text("Feedback Score:")
                    .fontWeight(.bold)
                Text("\(String(format: "%.1f", seller.feedbackPercentage))%")
            }
            .padding(.horizontal)
            HStack {
                Text("Total Reviews:")
                    .fontWeight(.bold)
                Text("\(seller.reviewsCount)")
            }
            .padding(.horizontal)
        }
    }
}
