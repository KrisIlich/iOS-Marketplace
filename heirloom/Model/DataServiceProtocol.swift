//
//  DataServiceProtocol.swift
//  heirloom
//
//  Created by Kristopher on 9/18/24.
//

import Foundation

protocol DataServiceProtocol {
    func fetchItem(by id: UUID, completion: @escaping (Result<Item, Error>) -> Void)
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void)
    func fetchReviews(for itemId: UUID, completion: @escaping (Result<[Review], Error>) -> Void)
}
