//
//  Seller.swift
//  heirloom
//
//  Created by Kristopher on 7/10/24.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let profileImageURL: URL?
    let joinDate: Date
    let feedbackPercentage: Double
    let reviewsCount: Int
    
    init(
           id: UUID = UUID(),
           name: String,
           profileImageURL: URL? = nil,
           joinDate: Date = Date(),
           feedbackPercentage: Double,
           reviewsCount: Int
       ) {
           self.id = id
           self.name = name
           self.profileImageURL = profileImageURL
           self.joinDate = joinDate
           self.feedbackPercentage = feedbackPercentage
           self.reviewsCount = reviewsCount
       }
}
