import SwiftUI

struct ItemView: View {
    @StateObject var viewModel: ItemViewModel
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        if viewModel.isLoading {
            ProgressView("Loading...")
        } else if let item = viewModel.item {
            
            VStack {
                ItemHeader()
                
                ScrollView {
                    VStack(alignment: .leading) {
                
                    
                        ImageCarouselView(imageUrls: item.imageUrls)

                        // Title
                        Text(item.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        SellerInfoView(seller: item.seller)

                        PriceAndShippingView(item: item)

                        Text("Condition: \(item.condition)")
                            .padding(.horizontal)
                            .padding(.bottom)

                        ActionButtons()
                            .padding(.horizontal)
                            .padding(.bottom, 8)

                        Text("\(item.watchersCount) people are watching this item")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.bottom)

                        AboutThisItemView(item: item)
                            .padding(.bottom)

                        ItemDescriptionView(description: item.description)
                            .padding(.bottom)

                        ShippingReturnsPaymentsView(item: item)
                        
                        BuyerProtectionView()
                            .padding(.bottom)

                        AboutSellerView(seller: item.seller)


                        SellerFeedbackView(seller: item.seller)

                        if !viewModel.reviews.isEmpty {
                            ReviewsSection(reviews: viewModel.reviews)
                        }
                    }
                }
                .navigationBarTitle("Item Details", displayMode: .inline)
                .alert(item: $viewModel.error) { (error: ViewError) in
                    Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
            }
        } else {
            Text("Item not found")
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(viewModel: ItemViewModel(itemId: MockData.sampleItem.id))
    }
}


