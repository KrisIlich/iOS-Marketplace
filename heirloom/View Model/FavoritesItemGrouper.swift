//
//  CartItemGrouper.swift
//  heirloom
//
//  Created by Kristopher on 9/25/24.
//

import Foundation
import Combine

class FavoritesItemGrouper: ObservableObject {
    @Published var groupedCartItems: [(seller: User, items: [CartItem])] = []
    
    var groupedCartItemsPublisher: Published<[(seller: User, items: [CartItem])]>.Publisher {
        $groupedCartItems
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(cartItems: [CartItem] = []) {
        self.groupedCartItems = FavoritesItemGrouper.groupAndSort(cartItems: cartItems)
    }
    
    func update(cartItems: [CartItem]) {
            self.groupedCartItems = FavoritesItemGrouper.groupAndSort(cartItems: cartItems)
            print("Updated groupedCartItems. Count: \(self.groupedCartItems.count)")
    }
    
    private static func groupAndSort(cartItems: [CartItem]) -> [(seller: User, items: [CartItem])] {
        
        let groupedDictionary = Dictionary(grouping: cartItems, by: { $0.item.seller })
        
        let groupedArray = groupedDictionary.map { (seller: $0.key, items: $0.value)}
        
        let sortedSellers = groupedArray.sorted { first, second in
            guard let firstDate = first.items.map({ $0.dateAdded }).min(),
                  let secondDate = second.items.map({ $0.dateAdded }).min() else {
                return false
            }
            return firstDate < secondDate
        }
        
        let sortedGroupArray = sortedSellers.map { (seller: $0.seller, items: $0.items.sorted { $0.dateAdded < $1.dateAdded})}
        
        return sortedGroupArray
        
    }
}
