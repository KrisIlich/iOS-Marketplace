
import Foundation

struct Item: Identifiable, Codable {
    
    var id: UUID
    var name: String
    var description: String
    var categoryId: UUID
    var price: Decimal
    var currency: String
    var imageUrls: [URL] //image names or urls
    var seller: User
    var condition: String
    var shippingPrice: Decimal
    var estimatedDelivery: DateInterval
    var watchersCount: Int
    var itemNumber: String
    var quantity: Int
    var upc: String
    var details: [String: String]
    
    init(
        id: UUID,
        name: String,
        description: String,
        categoryId: UUID,
        price: Decimal,
        currency: String,
        imageUrls: [URL],
        seller: User,
        condition: String,
        shippingPrice: Decimal,
        estimatedDelivery: DateInterval,
        watchersCount: Int,
        itemNumber: String,
        quantity: Int,
        upc: String,
        details: [String : String]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.categoryId = categoryId
        self.price = price
        self.currency = currency
        self.imageUrls = imageUrls
        self.seller = seller
        self.condition = condition
        self.shippingPrice = shippingPrice
        self.estimatedDelivery = estimatedDelivery
        self.watchersCount = watchersCount
        self.itemNumber = itemNumber
        self.quantity = quantity
        self.upc = upc
        self.details = details
    }
    
}

extension Item {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        return formatter.string(from: price as NSNumber) ?? "\(currency) \(price)"
    }
}


