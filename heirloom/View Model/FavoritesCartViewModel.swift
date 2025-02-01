//
//  CartViewModel.swift
//  heirloom
//
//  Created by Kristopher on 9/23/24.
//

import Foundation
import Combine

class FavoritesCartViewModel: ObservableObject {
    @Published var cart: Cart = Cart(items: []) {
        didSet {
            print("Cart updated. Number of items: \(cart.items.count)")
            cartItemGrouper.update(cartItems: cart.items)
            saveCart()
        }
    }
    @Published var error: ViewError?
    @Published var cartItemGrouper: CartItemGrouper
    
    private let cartKey = "userCart"
    private var cancellables = Set<AnyCancellable>()
    
    
    //change to true when not using mock data
    init(cart: Cart = Cart(items: []), loadFromPersistence: Bool = true) {
        self.cartItemGrouper = CartItemGrouper(cartItems: cart.items)

        if loadFromPersistence, let savedCart = loadCart() {
            self.cart = savedCart
        } else {
            self.cart = cart
        }
        
        
        $cart
            .map { $0.items }
            .sink { [weak self] items in
                self?.cartItemGrouper.update(cartItems: items)
            }
            .store(in: &cancellables)
    }
    
    // DATA PERSISTENCE
    
    private func saveCart() {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(cart)
            UserDefaults.standard.set(data, forKey: cartKey)
            print("Cart saved successfully")
        } catch {
            print("Failed to save cart")
            self.error = ViewError(message: "Failed to save cart")
        }
    }
    
    private func loadCart() -> Cart? {
        guard let data = UserDefaults.standard.data(forKey: cartKey) else {
            print("no saved cart found")
            return nil
        }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedCart = try decoder.decode(Cart.self, from: data)
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
        if let existingIndex = cart.items.firstIndex(where: { $0.item.id == item.id }) {
            cart.items[existingIndex].quantity += quantity
        } else {
            // add new item
            let newCartItem = CartItem(id: UUID(), item: item, quantity: quantity, dateAdded: Date())
            cart.items.append(newCartItem)
        }
    }
    
    func increaseQuantity(for cartItem: CartItem) {
        if let index = cart.items.firstIndex(where: { $0.id == cartItem.id }) {
            cart.items[index].quantity += 1
            print("Increased quantity for: \(cart.items[index].item.name) to \(cart.items[index].quantity)")
        } else {
            print("Item not found in cart: \(cartItem.item.name)")
        }
    }

    
    func decreaseQuantity(for cartItem: CartItem) {
        if let index = cart.items.firstIndex(where: { $0.id == cartItem.id }) {
            if cart.items[index].quantity > 1 {
                cart.items[index].quantity -= 1
                print("Decreased quantity for: \(cart.items[index].item.name) to \(cart.items[index].quantity)")
            } else {
                // Quantity is 1; do not remove directly
                print("Attempted to decrease quantity below 1 for: \(cart.items[index].item.name)")
            }
        } else {
            print("Item not found in cart: \(cartItem.item.name)")
        }
    }
    
    func removeItem(_ cartItem: CartItem) {
        print("Attempting to remove item: \(cartItem.item.name)")
        cart.items.removeAll { $0.id == cartItem.id }
        print("Item removed: \(cartItem.item.name). New cart items count: \(cart.items.count)")

    }
    
    func saveForLater(_ cartItem: CartItem) {
        removeItem(cartItem)
        //add to favorites or wish list
    }
    
    // TOTALS
    
    func totalCost() -> Decimal {
        cart.items.reduce(0) { $0 + ($1.item.price * Decimal($1.quantity))}
    }
    
    func totalShipping() -> Decimal {
        cart.items.reduce(0) { $0 + ($1.item.shippingPrice * Decimal($1.quantity)) }
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
