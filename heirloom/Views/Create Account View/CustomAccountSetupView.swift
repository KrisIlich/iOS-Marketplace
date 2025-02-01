//
//  CustomAccountSetupView.swift
//  heirloom
//
//  Created by Kristopher on 7/17/24.
//

import SwiftUI




struct CustomAccountSetupView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showHomeScreenView: Bool
    @Binding var showSignInView: Bool
    @Binding var showCreateAccountView: Bool
    @Binding var showCreateCustomAccountSetupView: Bool
    @Binding var showCustomAccountSetupView: Bool
    @State private var showCreateCustomAccountPasswordView = false
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
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
                    
                    Text("Create an account")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#56666B"))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showSignInView = false
                            showCreateAccountView = false
                            showCustomAccountSetupView = false
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
                
                Text("Let's get started")
                    .foregroundColor(Color(hex: "#56666B"))
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Text("Please enter a valid email")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray))
                    .fontWeight(.light)
                    .padding(.bottom, 15)
                
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(hex: "#E4DFDA"))
                        .cornerRadius(8)
                    
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color(hex: "#E4DFDA"))
                        .cornerRadius(8)
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color(hex: "#E4DFDA"))
                        .cornerRadius(8)
                    
                    NavigationLink(destination: CreateCustomAccountPasswordView(
                            showHomeScreenView: $showHomeScreenView,
                            showSignInView: $showSignInView,
                            showCreateAccountView: $showCreateAccountView,
                            showCreateCustomAccountPasswordView: $showCreateCustomAccountPasswordView))
                    {
                        Text("Continue")
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

struct CustomAccountSetupView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAccountSetupView(showHomeScreenView: .constant(false), showSignInView: .constant(false), showCreateAccountView: .constant(false), showCreateCustomAccountSetupView: .constant(false), showCustomAccountSetupView: .constant(false))
    }
}
