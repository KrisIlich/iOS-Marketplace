//
//  ItemViewModel.swift
//  heirloom
//
//  Created by Kristopher on 9/18/24.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject {
    @Published var item: Item?
    @Published var reviews: [Review] = []
    @Published var isLoading: Bool = false
    @Published var error: ViewError?
    
    private var dataService: DataServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(itemId: UUID? = nil, dataService: DataServiceProtocol = MockDataService()) {
        self.dataService = dataService
        if let itemId = itemId {
                   fetchItemDetails(itemId: itemId)}
    }
    
    func fetchItemDetails(itemId: UUID) {
        isLoading = true
        dataService.fetchItem(by: itemId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let item):
                    self?.item = item
                    self?.fetchReviews(for: item.id)
                case .failure(let error):
                    self?.error = ViewError(message: error.localizedDescription)
                }
            }
            
        }
    }
    
    func fetchReviews(for itemId: UUID) {
        dataService.fetchReviews(for: itemId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reviews):
                    self?.reviews = reviews
                case .failure(let error):
                    self?.error = ViewError(message: error.localizedDescription)
                }
            }
        }
    }
}
