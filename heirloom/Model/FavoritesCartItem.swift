//
//  CartItem.swift
//  heirloom
//
//  Created by Kristopher on 9/23/24.
//

import Foundation

struct FavoritesCartItem: Identifiable, Codable {
    let id: UUID
    let item: Item
    var quantity: Int
    let dateAdded: Date

    init(id: UUID, item: Item, quantity: Int, dateAdded: Date) {
        self.id = id
        self.item = item
        self.quantity = quantity
        self.dateAdded = dateAdded
    }
}


