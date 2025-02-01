//
//  CustomAccountSetupView.swift
//  heirloom
//
//  Created by Kristopher on 7/17/24.
//

import SwiftUI




struct CreateCustomAccountPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showHomeScreenView: Bool
    @Binding var showSignInView: Bool
    @Binding var showCreateAccountView: Bool
    @Binding var showCreateCustomAccountPasswordView: Bool

    @State private var password: String = ""
 
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0){
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
                    
                    Text("Create a password")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#56666B"))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showCreateAccountView = false
                            showSignInView = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(hex: "#56666B"))
                            .frame(width: 35, height: 35)
                            .background(Color(hex: "#E4DFDA"))
                            .cornerRadius(11)
                    }
                }
                .padding(.bottom, 35)
                
                Text("Create a password")
                    .foregroundColor(Color(hex: "#56666B"))
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
            
                Text("Passwords must be at least 8 characters long and include a number or symbol")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray))
                    .fontWeight(.light)
                    .padding(.bottom, 35)
                
                VStack(spacing: 5) {
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color(hex: "#E4DFDA"))
                        .cornerRadius(8)

                    
        
                    
                    Button(action: {
                        showCreateCustomAccountPasswordView = false
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "75bba7"))
                            .cornerRadius(12)
                    }
                    .padding(.top, 20)
                    
                }
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationBarHidden(true)
    }
}

struct CreateCustomAccountPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCustomAccountPasswordView(showHomeScreenView: .constant(false), showSignInView: .constant(false), showCreateAccountView: .constant(false), showCreateCustomAccountPasswordView: .constant(false))
    }
}
