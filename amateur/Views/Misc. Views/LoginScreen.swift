import SwiftUI
import FirebaseAuth


struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
            VStack {
                Text("A  m  a  t  e  u  r")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.Blue2)
                Spacer()
                HStack {
                    TextField("Email", text: $email)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                }
                HStack {
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
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.theme.Green2)
                })
                Spacer()
                //create account button
                NavigationLink("Create Account", destination: SignupScreen())
                    .padding()
            }
            .background(Color.theme.Yellow3)
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
