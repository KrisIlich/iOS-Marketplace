
import SwiftUI

struct CategoriesList: View {
    var categories: [Category]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Shop Categories")
                .font(.system(size: 24, weight: .bold)) // Bold heading
                .foregroundColor(Color(hex: "#B08D57")) // Antique Gold color for heading
                .padding(.bottom, 0)
                
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
                ForEach(categories) { category in
                    VStack {
                        Button(action: {
                            //action 
                        }) {
                            Image(systemName: category.iconName) // Placeholder icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110) // Circle size
                          
                                .background(Circle().fill(Color.gray.opacity(0.2))) // Placeholder circle background
                                .clipShape(Circle())
                        }
                        Text(category.name)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(hex: "#56666B")) // Gray color
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: true, vertical: true)
                    }
                    .frame(width: 110, height: 140)
                    .padding(.leading)
                    .padding(.trailing)
                }
                
            }
            
        }
        .cornerRadius(10)
        .padding()
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList(categories: [
            Category(name: "Antiques", iconName: ""),
            Category(name: "Modern", iconName: ""),
            Category(name: "For Stylists", iconName: ""),
            Category(name: "Art Deco", iconName: ""),
            Category(name: "Mid Century", iconName: ""),
            Category(name: "Minimalism", iconName: "")
        ])
    }
}
