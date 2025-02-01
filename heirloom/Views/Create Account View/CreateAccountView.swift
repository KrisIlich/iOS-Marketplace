import SwiftUI

struct CreateAccountView: View {
    @Binding var showHomeScreenView: Bool
    @Binding var showSignInView: Bool
    @Binding var showCreateAccountView: Bool
    @State private var showCustomAccountSetupView = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    Text("Create an account")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#56666B"))
                        .frame(maxWidth: .infinity, alignment: .center)

                    Spacer()

                    Button(action: {
                        withAnimation {
                            showCreateAccountView = false
                            showSignInView = false
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
                Text("Create an account with an email and username, or link a social account.")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.leading)

                Spacer()
                VStack {
                    NavigationLink(destination: CustomAccountSetupView(
                        showHomeScreenView: $showHomeScreenView,
                        showSignInView: $showSignInView,
                        showCreateAccountView: $showCreateAccountView,
                        showCreateCustomAccountSetupView: $showCustomAccountSetupView,
                        showCustomAccountSetupView: $showCustomAccountSetupView)) 
                    {
                        Text("Use Email or Username")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    
                    HStack {
                        VStack { Divider() }
                        Text("    or    ")
                            .foregroundColor(Color(hex: "56666B"))
                        VStack { Divider() }
                    }
                    .padding()

                    Button(action: {
                        //action
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Sign in with Apple")
                                .font(.headline)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(2)
                    }
                    .padding(.bottom, 5)

                    Button(action: {
                        //action
                    }) {
                        HStack {
                            if let googleLogo = UIImage(named: "GLogo") {
                                Image(uiImage: googleLogo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 220, height: 220)
                            } else {
                                Image(systemName: "globe")
                            }
                            Text("Sign in with Google")
                                .font(.headline)
                        }
                        .foregroundColor(Color(hex: "#56666B"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color(hex: "#56666B"))
                        )
                    }
                    .padding(.bottom, 5)

                    Button(action: {
                        //action
                    }) {
                        HStack {
                            Image(systemName: "f.square.fill")
                            Text("Sign in with Facebook")
                                .font(.headline)
                        }
                        .foregroundColor(Color(hex: "#56666B"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color(hex: "#56666B"))
                        )
                    }
                    .padding(.bottom)
                }
            }
            .navigationBarHidden(true)
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(showHomeScreenView: .constant(false), showSignInView: .constant(false), showCreateAccountView: .constant(false))
    }
}
