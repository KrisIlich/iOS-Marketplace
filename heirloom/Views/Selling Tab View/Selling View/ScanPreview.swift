//
//  ScanPreview.swift
//  heirloom
//
//  Created by Kristopher on 11/4/24.
//

import SwiftUI

struct ScanPreview: View {
    var body: some View {
        VStack {
            Text("Scan Preview")
                .font(.title)
                .padding()

            // Placeholder for scanned image/3D model preview
            Rectangle()
                .frame(height: 300)
                .foregroundColor(.gray)

            HStack {
                Button(action: {
                    // Retake scan
                }) {
                    Text("Retake")
                }
                .padding()
                
                Button(action: {
                    // Save scan
                }) {
                    Text("Save")
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    ScanPreview()
}
