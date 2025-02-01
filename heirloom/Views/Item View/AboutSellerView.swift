import SwiftUI

struct AboutSellerView: View {
    var seller: User

    var body: some View {
        VStack(alignment: .leading) {
            Text("About this seller")
                .font(.title)
                .bold()
                .padding(.top, 8)
                .padding(.horizontal)
            SellerInfoView(seller: seller)
            Text("Member since \(formattedJoinDate(seller.joinDate))")
                .foregroundColor(.gray)
                .padding(.horizontal)
            HStack {
                Button(action: {
                    // Seller's Other Items Action
                }) {
                    Text("Seller's Other Items")
                        .foregroundColor(.blue)
                }
                Spacer()
                Button(action: {
                    // Contact Seller Action
                }) {
                    Text("Contact Seller")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
        }
    }

    func formattedJoinDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}
