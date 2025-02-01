import SwiftUI

struct ReviewRow: View {
    var review: Review

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                AsyncImage(url: review.reviewer.profileImageURL) { phase in
                    if let image = phase.image {
                        image.resizable()
                    } else if phase.error != nil {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(review.reviewer.name)
                        .font(.headline)
                    Text(formattedDate(review.date))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                // Rating Stars
                HStack(spacing: 2) {
                    ForEach(0..<review.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    ForEach(0..<(5 - review.rating), id: \.self) { _ in
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 4)
            Text(review.comment)
                .padding(.horizontal)
                .padding(.top, 4)
        }
        .padding(.bottom, 8)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
