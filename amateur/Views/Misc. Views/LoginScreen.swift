import SwiftUI
import FirebaseAuth


struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.80)
                    .padding()

                Spacer()
                VStack {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                }                    
                    Spacer()
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return //return what? an error message?
                        }
                        loginViewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.black)
                            .frame(width: 100, height: 50)
                            .border(Color.black)
   
                    })
                    Spacer()
                   
                    NavigationLink("Create Account", destination: SignupScreen())
                        .padding()
            }
        }
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
