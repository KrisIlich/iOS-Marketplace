import SwiftUI

struct ShoppingList: View {
    @StateObject private var viewModel = ShoppingListViewModel()
    @EnvironmentObject var favoritesCartViewModel: FavoritesCartViewModel

    var body: some View {
        VStack {
            if let error = viewModel.error {
                Text("Error: \(error.message)")
            } else {
                ScrollView {
                        LazyVStack(spacing: -20) {
                            
                            
                            ForEach(viewModel.items) { item in
                                NavigationLink(destination: ItemView(viewModel: ItemViewModel(itemId: item.id))) {
                                    ItemRowView(item: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
            }
        }
        .onAppear {
            viewModel.fetchItems()
        }
    }
}

#Preview {
    NavigationView {
        ShoppingList()
            .environmentObject(FavoritesCartViewModel())
            .environmentObject(FavoritesCartViewModel())
    }
}

/*  RecommendedSellerList(sellers: [
 User(name: "Seller 1"),
 User(name: "Seller 2"),
 User(name: "Seller 3"),
 User(name: "Seller 4"),
 User(name: "Seller 5")
])
CategoriesList(categories: [
 Category(name: "Antiques", iconName: ""),
 Category(name: "Modern", iconName: ""),
 Category(name: "For Stylists", iconName: ""),
 Category(name: "Art Deco", iconName: ""),
 Category(name: "Mid Century", iconName: ""),
 Category(name: "Minimalism", iconName: "")
])
RecommendedSellerList(sellers: [
 User(name: "Seller 1"),
 User(name: "Seller 2"),
 User(name: "Seller 3"),
 User(name: "Seller 4"),
 User(name: "Seller 5")
])
*/
