//
//  Review.swift
//  heirloom
//
//  Created by Kristopher on 9/18/24.
//

import Foundation

struct Review: Identifiable, Codable{
    var id: UUID
    var reviewer: User
    var rating: Int
    var comment: String
    var date: Date
    let itemId: UUID

    init(id: UUID, reviewer: User, rating: Int, comment: String, date: Date, itemId: UUID) {
        self.id = id
        self.reviewer = reviewer
        self.rating = rating
        self.comment = comment
        self.date = date
        self.itemId = itemId
    }
}
