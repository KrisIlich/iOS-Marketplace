//
//  SavedItem.swift
//  heirloom
//
//  Created by Kristopher on 8/28/24.
//

import Foundation

struct SavedSearch: Identifiable {
    let id = UUID()
    let searchItem: String
    let searchType: String
    let date: Date
}
