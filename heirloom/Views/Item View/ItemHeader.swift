//
//  ItemHeader.swift
//  heirloom
//
//  Created by Kristopher on 9/22/24.
//

import SwiftUI

struct ItemHeader: View {
    @Environment(\.presentationMode) var presentationMode
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
            
            Spacer()
            
            Text("Item")
                .font(.headline)
                .foregroundColor(Color(hex: "#56666B"))
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            
            Button(action: {
                withAnimation {
                   //
                }
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color(hex: "#56666B"))
                    .frame(width: 35, height: 35)
                    .background(Color(hex: "#E4DFDA"))
                    .cornerRadius(11)
            }
        }
        .padding(.bottom, 4)
        .padding(.horizontal)
    }
}

#Preview {
    ItemHeader()
}
