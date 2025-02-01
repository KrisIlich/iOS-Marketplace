//
//  ReviewSection.swift
//  heirloom
//
//  Created by Kristopher on 9/20/24.
//

import SwiftUI

struct ReviewsSection: View {
    var reviews: [Review]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reviews")
                .font(.headline)
                .padding(.top, 8)
                .padding(.horizontal)
            ForEach(reviews) { review in
                ReviewRow(review: review)
            }
        }
    }
}
