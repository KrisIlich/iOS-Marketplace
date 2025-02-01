//
//  Seller.swift
//  heirloom
//
//  Created by Kristopher on 7/10/24.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var profileImage: String
    var joinDate: String
    var feedbackScore: Int
    var feedbackPercentage: Double
    var reviewsCount: Int
}
