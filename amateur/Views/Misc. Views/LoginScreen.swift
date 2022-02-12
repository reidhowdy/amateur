import SwiftUI
import FirebaseAuth


struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
            VStack {
//                Text("A  m  a  t  e  u  r")
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.theme.Blue2)
                Spacer()
//                GeometryReader { geometry in
                    Image("Logo")
                        .resizable()
                        .frame(width: 300, height: 100)
                        .padding()
//                }
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
                        .foregroundColor(Color.black)
                        .frame(width: 100, height: 50)
                        .border(Color.black)
//                        .background(Color.black)
                })
                Spacer()
                //create account button
                NavigationLink("Create Account", destination: SignupScreen())
                    .padding()
            }
//            .background(Color.theme.Yellow3)
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
