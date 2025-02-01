import SwiftUI

struct SellingItemView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var categoryId: UUID? = nil
    @State private var price: Decimal = 0.0
    @State private var currency: String = "USD"
    @State private var imageUrls: [URL] = []
    @State private var condition: String = ""
    @State private var shippingPrice: Decimal = 0.0
    @State private var estimatedDeliveryStart: Date = Date()
    @State private var estimatedDeliveryEnd: Date = Date()
    @State private var quantity: Int = 1
    @State private var upc: String = ""
    @State private var details: [String: String] = [:]
    @Binding var showSellingItemView: Bool

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()

                        Text("Selling Summary")
                            .font(.headline)
                            .foregroundColor(Color(hex: "#56666B"))
                            .frame(maxWidth: .infinity, alignment: .center)

                        Spacer()

                        Button(action: {
                            withAnimation {
                                showSellingItemView = false
                            }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(Color(hex: "#56666B"))
                                .frame(width: 35, height: 35)
                                .background(Color(hex: "#E4DFDA"))
                                .cornerRadius(11)
                        }
                    }
                    .padding(.horizontal)
                .padding(.bottom, 35)
                }
            
            
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Photos
                        Text("Photos")
                            .font(.headline)
                        PhotoPicker(imageUrls: $imageUrls) // Assuming a PhotoPicker view to handle image selection
                        
                        // Title
                        TextField("Title", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Description
                        Text("Description")
                            .font(.headline)
                        TextEditor(text: $description)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(height: 150)
                            .border(Color.gray, width: 0.5)
                            .padding(.bottom, 10)
                        
                        
                        // Category
                        Text("Category")
                            .font(.headline)
                        Button(action: {
                            // Category selection logic
                        }) {
                            HStack {
                                Text(categoryId != nil ? "Selected Category" : "Select Category")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                        
                        // Price
                        Text("Price")
                            .font(.headline)
                        HStack {
                            TextField("Enter price", value: $price, format: .currency(code: currency))
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Text(currency)
                        }
                        
                        // Condition
                        Text("Condition")
                            .font(.headline)
                        TextField("Enter condition", text: $condition)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Shipping Price
                        Text("Shipping Price")
                            .font(.headline)
                        TextField("Enter shipping price", value: $shippingPrice, format: .currency(code: currency))
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Estimated Delivery
                        Text("Estimated Delivery")
                            .font(.headline)
                        HStack {
                            DatePicker("Start Date", selection: $estimatedDeliveryStart, displayedComponents: .date)
                                .labelsHidden()
                            Text("to")
                            DatePicker("End Date", selection: $estimatedDeliveryEnd, displayedComponents: .date)
                                .labelsHidden()
                        }
                        
                        // Quantity
                        Text("Quantity")
                            .font(.headline)
                        Stepper(value: $quantity, in: 1...100) {
                            Text("\(quantity)")
                        }
                        
                        // UPC
                        Text("UPC")
                            .font(.headline)
                        TextField("Enter UPC", text: $upc)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Details
                        Text("Item Details")
                            .font(.headline)
                        ForEach(details.keys.sorted(), id: \.self) { key in
                            HStack {
                                TextField("Detail key", text: .constant(key))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .disabled(true)
                                TextField("Detail value", text: Binding(
                                    get: { details[key] ?? "" },
                                    set: { details[key] = $0 }
                                ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                        Button(action: {
                            // Add a new detail
                            details[""] = ""
                        }) {
                            Text("Add Detail")
                        }
                        
                        // Save Button
                        Button(action: {
                            // Save the new listing
                        }) {
                            Text("List Item")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct PhotoPicker: View {
    @Binding var imageUrls: [URL]
    
    var body: some View {
        VStack {
            // Display existing photos
            ForEach(imageUrls, id: \.self) { url in
                // Assuming a way to display the images from URL
                Text(url.absoluteString) // Placeholder
            }
            NavigationLink(destination: CameraView()) {
                Text("Add Photo")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
    }
}



/*   ScrollView(.horizontal, showsIndicators: false) {
 HStack {
     Text("Step 1: \n\nFill in Listing Details")
         .font(.title)
         .padding()
         .frame(width: 300, height: 300)
         .background(Color.gray.opacity(0.5))
         .cornerRadius(24)
     Text("Step 2: \n\nUtilize our state of the art 3D camera")
         .font(.title)
         .padding()
         .frame(width: 300, height: 300)
         .background(Color.gray.opacity(0.5))
         .cornerRadius(24)
     Text("Step 3: \n\nEdit Your Listing")
         .font(.title)
         .padding()
         .frame(width: 300, height: 300)
         .background(Color.gray.opacity(0.5))
         .cornerRadius(24)
 }
}
.padding(.bottom)


NavigationLink(destination: {
 ListingSummary()
}) {
 Text("Continue To Listing")
     .frame(maxWidth: .infinity)
     .padding()
     .background(Color.blue)
     .foregroundColor(.white)
     .cornerRadius(10)
}

Spacer()
}

.padding(10) // Add padding so the gradient effect doesn't cover the content
.background(
// Create a radial gradient that fades from gray to clear
RadialGradient(
 gradient: Gradient(colors: [
     Color.gray.opacity(0.0),
     Color.gray.opacity(1.0)
 ]),
 center: .top,
 startRadius: 400, // Start the gradient close to the edges
 endRadius: 650 // End it towards the center
)
.scaleEffect(animate ? 1.5 : 1.2) // Scale to achieve pulsating effect
.animation(
 Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),
 value: animate
)
)
.onAppear {
animate = true // Start animation when view appears*/


#Preview {
    SellingItemView(showSellingItemView: .constant(false))
}
