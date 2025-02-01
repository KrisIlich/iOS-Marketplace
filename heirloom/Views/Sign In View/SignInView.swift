import SwiftUI

struct SignInView: View {
    @Binding var showSignInView: Bool
    @Binding var showCreateAccountView: Bool
    @State private var showHomeScreenView = false
    @State private var showCreateAccountFromSignInView = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Spacer()
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#56666B"))
                    
                    Spacer()
                    
                    Color.clear
                        .frame(width: 35, height: 35)
                    Button(action: {
                        withAnimation {
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
                
                Text("Hello")
                    .foregroundColor(Color(hex: "#56666B"))
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Text("Sign in with your email, username, or continue with your social account.")
                    .font(.body)
                    .font(.headline)
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                VStack {
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
                            .stroke(Color(hex: "#56666B")))
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
                            .stroke(Color(hex: "#56666B")))
                }
                .padding(.bottom)
                VStack (alignment: .center) {
                    HStack {
                        Text("Haven't signed up yet?")
                            .foregroundColor(.gray)
                    }
                    
                    NavigationLink(destination: CreateAccountView(showHomeScreenView: $showHomeScreenView, showSignInView: $showSignInView, showCreateAccountView: $showCreateAccountView)) {
                        Text("Create an account")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                .frame(maxWidth: .infinity)
                .fullScreenCover(isPresented: $showCreateAccountView) {
                    CreateAccountView(showHomeScreenView: $showHomeScreenView, showSignInView: $showCreateAccountFromSignInView, showCreateAccountView: $showCreateAccountView)
                }
                .navigationBarHidden(true)
            }
            .padding(.horizontal)
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(showSignInView: .constant(false), showCreateAccountView: .constant(false))
    }
}
