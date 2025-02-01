//
//  RecommendedSellerList.swift
//  heirloom
//
//  Created by Kristopher on 7/10/24.
//

import SwiftUI

struct RecommendedSellerList: View {
    
    var sellers: [User]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Popular Sellers in San Diego")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(hex: "B08D57"))
                .padding()
                
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(sellers) { seller in
                        Button(action:  {
                        }) {
                            VStack {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color(hex: "#75bba7"))
                                Text(seller.name)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(Color(hex: "#56666B"))
                            }
                        }
                        .frame(width: 100)
                        .padding()
                        .background(Color(hex: "#E4DfDA"), in: RoundedRectangle(cornerRadius: 32))
                        .offset(x: 14)
                        .shadow(color: Color(.gray).opacity(0.3),radius: 2, x: 0, y: 5)
                        .padding(.bottom, 14)
                    }
                }
            }
        }
        .padding(.top, 15)
        .padding(.bottom, 30)
        .padding(.bottom, 10)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 32.0, style: .continuous))
        .padding(.horizontal)
        .shadow(color: Color(.gray).opacity(0.3),radius: 5, x: 0, y: 10)
    }
}

struct RecommendedSellerList_Previews: PreviewProvider {
    static var previews: some View{
        RecommendedSellerList(sellers: [
            User(name: "Seller 1", feedbackPercentage: 99.3, reviewsCount: 343),
            User(name: "Seller 2", feedbackPercentage: 83.3, reviewsCount: 234),
            User(name: "Seller 3", feedbackPercentage: 91.0, reviewsCount: 541),
            User(name: "Seller 4", feedbackPercentage: 92.4, reviewsCount: 23),
        ])
    }
}

