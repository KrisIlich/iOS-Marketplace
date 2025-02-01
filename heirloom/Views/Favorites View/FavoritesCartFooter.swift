import SwiftUI

struct FavoritesCartFooter: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                // Implement your checkout logic here
                // Example: viewModel.confirmPurchase()
            }) {
                Text("Go To Checkout")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .cornerRadius(32)
            .padding(.bottom, 8)
            .buttonStyle(PlainButtonStyle()) // Ensures no default styling
            
            HStack {
                Text("Shipping to Zipcode:")
                    .fontWeight(.light)
                Spacer()
                Text("USD \(Double(truncating: viewModel.totalShipping() as NSNumber), specifier: "%.2f")")
                    .fontWeight(.light)
            }
            
            HStack {
                Text("Subtotal:")
                    .fontWeight(.light)
                Spacer()
                Text("USD \(Double(truncating: viewModel.totalPrice() as NSNumber), specifier: "%.2f")")
                    .fontWeight(.bold)
            }
            .padding(.bottom)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 1)
    }
}

struct CartFooter_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesCartFooter(viewModel: CartViewModel())
    }
}
