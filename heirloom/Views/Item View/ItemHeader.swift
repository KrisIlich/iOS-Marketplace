//
//  ItemHeader.swift
//  heirloom
//
//  Created by Kristopher on 9/22/24.
//

import SwiftUI

struct ItemHeader: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showCartView = false
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Image(systemName: "arrow.turn.up.left")
                    .foregroundColor(Color(hex: "#56666B"))
                    .frame(width: 35, height: 35)
                    .background(Color(hex: "#E4DFDA"))
                    .cornerRadius(11)
            }
            Text("Item")
                .font(.headline)
                .foregroundColor(Color(hex: "#56666B"))
                .frame(maxWidth: .infinity, alignment: .center)
            
            Button(action: {
                withAnimation {
                    showCartView.toggle()
                }
            }) {
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .foregroundColor(Color(hex:"#75bba7"))
                    .frame(width: 30, height: 30)
                    .cornerRadius(11)
            }
            
            
           
        }
        .frame(height: 35)
        .padding(.bottom, 4)
        .padding(.horizontal)
    }
}

#Preview {
    ItemHeader()
}
