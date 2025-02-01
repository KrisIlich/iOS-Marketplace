//
//  CameraView.swift
//  heirloom
//
//  Created by Kristopher on 11/4/24.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        ZStack {
            Color.black
            
            VStack{
                Spacer()
                
                Button(action: {
                    // trigger lidar scan initiation
                }) {
                    Text("Activate 3D Scan")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.padding(.bottom, 30)
        }.edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    CameraView()
}
