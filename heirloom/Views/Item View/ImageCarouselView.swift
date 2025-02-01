//
//  ImageCarouselView.swift
//  heirloom
//
//  Created by Kristopher on 9/18/24.
//

import SwiftUI

struct ImageCarouselView: View {
    var imageUrls: [URL]
    @State private var selection = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
            TabView(selection: $selection) {
                ForEach(imageUrls.indices, id: \.self) { index in
                        AsyncImage(url:imageUrls[index]) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                            } else if phase.error != nil {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                            } else {
                                ProgressView()
                            }
                        }
                    .tag(index)
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
                
            Button(action: {
                //toggle favorite
            }) {
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .clipShape(Circle())
                    .padding(.horizontal, 25)
                    .padding(.bottom, 16)
            }
        }
            


    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
            ForEach(imageUrls.indices, id: \.self) { index in
                AsyncImage(url: imageUrls[index]) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(selection == index ? Color.blue : Color.clear, lineWidth:  2)
                            )
                    } else if phase.error != nil {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        } else {
                            ProgressView()
                                .frame(width:60, height: 60)
                        }
                    }
                    .onTapGesture() {
                        withAnimation {
                            selection = index
                        }
                        }
                    }
                }
            }
    .padding(.horizontal)
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleImageNames = ["sample1", "sample2", "sample3"]
        let sampleImageURLs = sampleImageNames.compactMap { imageName -> URL? in
            return Bundle.main.url(forResource: imageName, withExtension: "jpg")
        }
        return ImageCarouselView(imageUrls: sampleImageURLs)
    }
}
