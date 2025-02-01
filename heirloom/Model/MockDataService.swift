//
//  MockDataService.swift
//  heirloom
//
//  Created by Kristopher on 9/18/24.
//

import Foundation

class MockDataService: DataServiceProtocol {
    
    func fetchItem(by id: UUID, completion: @escaping (Result<Item, Error>) -> Void) {
           if let item = MockData.items.first(where: { $0.id == id }) {
               completion(.success(item))
           } else {
               let error = NSError(domain: "Item not found", code: 404, userInfo: nil)
               completion(.failure(error))
           }
       }
       
       func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
           completion(.success(MockData.items))
       }
       
       func fetchReviews(for itemId: UUID, completion: @escaping (Result<[Review], Error>) -> Void) {
           let reviews = MockData.reviews.filter { $0.itemId == itemId }
           completion(.success(reviews))
       }
   }
