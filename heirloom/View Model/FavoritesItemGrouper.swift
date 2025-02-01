//
//  CartItemGrouper.swift
//  heirloom
//
//  Created by Kristopher on 9/25/24.
//

import Foundation
import Combine

class FavoritesItemGrouper: ObservableObject {
    @Published var groupedFavoritesCartItems: [(seller: User, items: [FavoritesCartItem])] = []
    
    var groupedCartItemsPublisher: Published<[(seller: User, items: [FavoritesCartItem])]>.Publisher {
        $groupedFavoritesCartItems
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(favoritesCartItems: [FavoritesCartItem] = []) {
        self.groupedFavoritesCartItems = FavoritesItemGrouper.groupAndSort(favoritesCartItems: favoritesCartItems)
    }
    
    func update(favoritesCartItems: [FavoritesCartItem]) {
            self.groupedFavoritesCartItems = FavoritesItemGrouper.groupAndSort(favoritesCartItems: favoritesCartItems)
            print("Updated groupedCartItems. Count: \(self.groupedFavoritesCartItems.count)")
    }
    
    private static func groupAndSort(favoritesCartItems: [FavoritesCartItem]) -> [(seller: User, items: [FavoritesCartItem])] {
        
        let groupedDictionary = Dictionary(grouping: favoritesCartItems, by: { $0.item.seller })
        
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
