import Foundation

struct MockData {
    // 1. Declare and initialize 'sellers' first
    static let sellers: [User] = generateSellers()

    static func generateSellers() -> [User] {
        var sellersList: [User] = []
        // Generate 10 User instances representing sellers
        for i in 0..<10 {
            let seller = User(
                id: UUID(),
                name: "Seller \(i + 1)",
                profileImageURL: URL(string: "https://via.placeholder.com/150"),
                joinDate: Date(),
                feedbackPercentage: Double.random(in: 95...100),
                reviewsCount: Int.random(in: 10...100)
            )
            sellersList.append(seller)
        }
        return sellersList
    }

    // 2. Now declare and initialize 'items'
    static let items: [Item] = generateItems()

    static func generateItems() -> [Item] {
        var itemsList: [Item] = []
        var itemIdCounter = 0

        for sellerIndex in 0..<sellers.count {
            let seller = sellers[sellerIndex]
            for _ in 0..<3 {
                let item = Item(
                    id: UUID(),
                    name: "Item \(itemIdCounter)",
                    description: "Description for item \(itemIdCounter)",
                    categoryId: UUID(),
                    price: Decimal(Double.random(in: 10...100)),
                    currency: "USD",
                    imageUrls: [URL(string: "https://via.placeholder.com/200")!],
                    seller: seller,
                    condition: "New",
                    shippingPrice: Decimal(Double.random(in: 5...20)),
                    estimatedDelivery: DateInterval(start: Date(), duration: 5 * 86400),
                    watchersCount: Int.random(in: 1...10),
                    itemNumber: "ITEM\(itemIdCounter)",
                    quantity: Int.random(in: 1...5),
                    upc: "UPC\(itemIdCounter)",
                    details: [
                        "Material": "Material \(itemIdCounter)",
                        "Color": "Color \(itemIdCounter)"
                    ]
                )
                itemsList.append(item)
                itemIdCounter += 1
            }
        }
        return itemsList
    }

    // 3. Finally, declare and initialize 'reviews'
    static let reviews: [Review] = generateReviews()

    static func generateReviews() -> [Review] {
        var reviewsList: [Review] = []
        let comments = [
            "Absolutely love this item!",
            "Good quality, but shipping was delayed.",
            "Fantastic! Exceeded expectations.",
            "Item was okay, but had some scratches.",
            "Nice item, but packaging could be better.",
            "Excellent quality and fast shipping!",
            "Not as described, a bit disappointed.",
            "Great seller, highly recommended!",
            "Product works well, happy with the purchase.",
            "Average item, nothing special."
        ]

        for i in 0..<items.count {
            let reviewer = User(
                id: UUID(),
                name: "Reviewer \(i)",
                profileImageURL: nil,
                joinDate: Date(),
                feedbackPercentage: 99,
                reviewsCount: Int.random(in: 1...500)
            )
            let comment = comments[i % comments.count]
            let rating = Int.random(in: 3...5)
            let review = Review(
                id: UUID(),
                reviewer: reviewer,
                rating: rating,
                comment: comment,
                date: Date().addingTimeInterval(Double(-i * 24 * 60 * 60)),
                itemId: items[i].id
            )
            reviewsList.append(review)
        }
        return reviewsList
    }
}
