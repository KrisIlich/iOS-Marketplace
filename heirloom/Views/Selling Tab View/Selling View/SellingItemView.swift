import SwiftUI

struct LidarLandingScreen: View {
    @State private var animate = false
    @State private var searchText = ""

    var body: some View {
        VStack {
            
            CustomSearchBar(searchText: $searchText)
                .padding(.trailing, 14)
                .padding(.bottom)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Text("Step 1: \n\nSearch for Listing Category")
                        .font(.title)
                        .padding()
                        .frame(width: 300, height: 300)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(24)
                    Text("Step 2: \n\nFind Category")
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
                startRadius: 300, // Start the gradient close to the edges
                endRadius: 600 // End it towards the center
            )
            .scaleEffect(animate ? 1.5 : 1.2) // Scale to achieve pulsating effect
            .animation(
                Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                value: animate
            )
        )
        .onAppear {
            animate = true // Start animation when view appears
        }
    }
}

#Preview {
    LidarLandingScreen()
}
