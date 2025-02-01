//
//  CartViewModel.swift
//  heirloom
//
//  Created by Kristopher on 9/23/24.
//

import Foundation
import Combine

class FavoritesCartViewModel: ObservableObject {
    @Published var favoritesCart: FavoritesCart = FavoritesCart(items: []) {
        didSet {
            print("Cart updated. Number of items: \(favoritesCart.items.count)")
            favoritesCartItemGrouper.update(favoritesCartItems: favoritesCart.items)
            saveCart()
        }
    }
    @Published var error: ViewError?
    @Published var favoritesCartItemGrouper: FavoritesItemGrouper
    
    private let favoritesCartKey = "userCart"
    private var cancellables = Set<AnyCancellable>()
    
    
    //change to true when not using mock data
    init(favoritesCart: FavoritesCart = FavoritesCart(items: []), loadFromPersistence: Bool = true) {
        self.favoritesCartItemGrouper = FavoritesItemGrouper(favoritesCartItems: favoritesCart.items)

        if loadFromPersistence, let savedFavoritesCart = loadCart() {
            self.favoritesCart = savedFavoritesCart
        } else {
            self.favoritesCart = favoritesCart
        }
        
        
        $favoritesCart
            .map { $0.items }
            .sink { [weak self] items in
                self?.favoritesCartItemGrouper.update(favoritesCartItems: items)
            }
            .store(in: &cancellables)
    }
    
    // DATA PERSISTENCE
    
    private func saveCart() {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(favoritesCart)
            UserDefaults.standard.set(data, forKey: favoritesCartKey)
            print("Cart saved successfully")
        } catch {
            print("Failed to save cart")
            self.error = ViewError(message: "Failed to save cart")
        }
    }
    
    private func loadCart() -> FavoritesCart? {
        guard let data = UserDefaults.standard.data(forKey: favoritesCartKey) else {
            print("no saved cart found")
            return nil
        }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedCart = try decoder.decode(FavoritesCart.self, from: data)
            print("cart loaded successfully")
            return decodedCart
        } catch {
            print("Failed to load cart: \(error)")
            self.error = ViewError(message: "failed to load cart")
            return nil
        }
    }
    
    // CART OPERATIONS
    
    func addItem(_ item: Item, quantity: Int = 1) {
        //if item exists in cart add another
        if let existingIndex = favoritesCart.items.firstIndex(where: { $0.item.id == item.id }) {
            favoritesCart.items[existingIndex].quantity += quantity
        } else {
            // add new item
            let newCartItem = FavoritesCartItem(id: UUID(), item: item, quantity: quantity, dateAdded: Date())
            favoritesCart.items.append(newCartItem)
        }
    }
    
    func increaseQuantity(for FavoritesCartItem: FavoritesCartItem) {
        if let index = favoritesCart.items.firstIndex(where: { $0.id == FavoritesCartItem.id }) {
            favoritesCart.items[index].quantity += 1
            print("Increased quantity for: \(favoritesCart.items[index].item.name) to \(favoritesCart.items[index].quantity)")
        } else {
            print("Item not found in cart: \(FavoritesCartItem.item.name)")
        }
    }

    
    func decreaseQuantity(for cartItem: FavoritesCartItem) {
        if let index = favoritesCart.items.firstIndex(where: { $0.id == cartItem.id }) {
            if favoritesCart.items[index].quantity > 1 {
                favoritesCart.items[index].quantity -= 1
                print("Decreased quantity for: \(favoritesCart.items[index].item.name) to \(favoritesCart.items[index].quantity)")
            } else {
                // Quantity is 1; do not remove directly
                print("Attempted to decrease quantity below 1 for: \(favoritesCart.items[index].item.name)")
            }
        } else {
            print("Item not found in cart: \(cartItem.item.name)")
        }
    }
    
    func removeItem(_ cartItem: FavoritesCartItem) {
        print("Attempting to remove item: \(cartItem.item.name)")
        favoritesCart.items.removeAll { $0.id == cartItem.id }
        print("Item removed: \(cartItem.item.name). New cart items count: \(favoritesCart.items.count)")

    }
    
    func saveForLater(_ favoritesCartItem: FavoritesCartItem) {
        removeItem(favoritesCartItem)
        //add to favorites or wish list
    }
    
    // TOTALS
    
    func totalCost() -> Decimal {
        favoritesCart.items.reduce(0) { $0 + ($1.item.price * Decimal($1.quantity))}
    }
    
    func totalShipping() -> Decimal {
        favoritesCart.items.reduce(0) { $0 + ($1.item.shippingPrice * Decimal($1.quantity)) }
    }
    
    func totalPrice() -> Decimal {
        totalCost() + totalShipping()
    }
    
    func formattedTotalPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: totalPrice() as NSNumber) ?? "USD \(totalPrice())"
    }
    
}
