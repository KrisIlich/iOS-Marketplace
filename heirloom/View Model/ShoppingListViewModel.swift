import Foundation
import Combine

class ShoppingListViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var error: ViewError?
    @Published var isLoading: Bool = false

    private var dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol = MockDataService()) {
        self.dataService = dataService
    }

    func fetchItems() {
        isLoading = true
        dataService.fetchItems { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let items):
                    self?.items = items
                case .failure(let error):
                    self?.error = ViewError(message: error.localizedDescription)
                }
            }
        }
    }
}


/*I am creating a swift ios application called Heirloom, i am building out the front end currently but eventually going to integrate backend services from google cloud.
 
 I am modeling it after ebay, spotify type of aesthetic, more heavily on ebay since its going to be an ecommerce platform. The main hook is that to list items users will utilize llidar technology in their cameras.

 I have a good portion built out and I need your help finishing the application.

 About the appication architecture,  (minimal viable product, there isnt too much to these views yet) The application fires initially on the heirloomApp file, then everything goes through the contentView.

 views completed - HomeScreenView, AccountDashboardView, SearchView, NotificationView, ItemView, CartView, TabBar, searchBar.

 View Models completed - ItemViewModel, CartViewModel, CartItemGrouper, ShoppingListViewModel

 I had everything working but i was trying to tackle a bug with preview crashes. */
