import SwiftUI

struct ItemRowView: View {
    let item: Item
    @EnvironmentObject var favoritesCartViewModel: FavoritesCartViewModel
    @State private var showAddToCartAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 16) {
                // Item Image
                ItemThumbnailView(imageUrl: item.imageUrls.first)
                    .frame(width: 100, height: 100)

                VStack(alignment: .leading, spacing: 4) {
                    // Item Name
                    Text(item.name)
                        .font(.headline)
                        .lineLimit(2)

                    // Seller Name
                    Text("Seller: \(item.seller.name)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    // Price
                    Text("\(item.currency) \(Double(truncating: item.price as NSNumber), specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.primary)

                    // Shipping Price
                    Text("Shipping: \(item.currency) \(Double(truncating: item.shippingPrice as NSNumber), specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal)

            HStack {
                Spacer()
                Button(action: {
                    favoritesCartViewModel.addItem(item)
                    showAddToCartAlert = true
                }) {
                    Text("Add to Favorites")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .alert(isPresented: $showAddToCartAlert) {
                    Alert(title: Text("Added to Favorites"), message: Text("\(item.name) has been added to your favorites."), dismissButton: .default(Text("OK")))
                }
            }
            .padding(.trailing, 16)
        }
        .padding(12)
        .padding(.vertical, 15)
        .background(Color.white)
        .cornerRadius(32.0)
        .padding()
        .shadow(color: Color(.gray).opacity(0.3), radius: 7, x: 5, y: 5)
    }
}

#Preview {
    let sampleSeller = User(
        id: UUID(),
        name: "Sample Seller",
        profileImageURL: nil,
        joinDate: Date(),
        feedbackPercentage: 99.5,
        reviewsCount: 100
    )

    let sampleItem = Item(
        id: UUID(),
        name: "Sample Item",
        description: "This is a sample item",
        categoryId: UUID(),
        price: 49.99,
        currency: "USD",
        imageUrls: [],
        seller: sampleSeller,
        condition: "New",
        shippingPrice: 5.99,
        estimatedDelivery: DateInterval(start: Date(), duration: 5 * 86400),
        watchersCount: 10,
        itemNumber: "123456",
        quantity: 1,
        upc: "9876543210",
        details: ["Color": "Red", "Size": "M"]
    )

    return ItemRowView(item: sampleItem)
        .environmentObject(FavoritesCartViewModel())
}
