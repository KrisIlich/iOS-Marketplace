//
//  WelcomeFrame.swift
//  heirloom
//
//  Created by Kristopher on 9/26/24.
//

import SwiftUI

struct WelcomeFrame: View {
    @Binding var showCreateAccountView: Bool
    @Binding var showSignInView: Bool
    
    var body: some View {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome, Sign in for full customizations")
                        .font(.system(size: 24, weight: .bold))
                        .bold()
                        .padding(.horizontal)
                        .foregroundColor(Color(hex: "#56666B"))
                    
                    
                    HStack{
                        Button(action: {
                            withAnimation {
                                showCreateAccountView.toggle()
                            }
                        }) {
                            Text("Create an account")
                                .font(.headline)
                                .foregroundColor(Color(.blue).opacity(0.5))
                        }
                        
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showSignInView.toggle()
                            }
                        }) {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(Color(.blue).opacity(0.5))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                }
    }
}

#Preview {
    WelcomeFrame(showCreateAccountView: .constant(false), showSignInView: .constant(false))
}
