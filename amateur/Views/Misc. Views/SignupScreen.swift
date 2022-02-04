import SwiftUI
import Firebase

struct SignupScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var bio: String = ""
    
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    var userViewModel = UserViewModel()
    
    var body: some View {
            VStack {
                VStack {
                    Text("A  m  a  t  e  u  r")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                    Text("Create Account")
                        .font(.title)
                        .foregroundColor(Color.blue)
                }
                Spacer()
                VStack {
                    TextField("First Name", text: $firstName)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                    TextField("Last Name", text: $lastName)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                    TextField("Short bio", text: $bio)
                        .disableAutocorrection(true)
                        .frame(height: 100)
                        .autocapitalization(.none)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.leading, .trailing])
                        .background(Color.white)
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                }
                Spacer()
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return //return what? an error message?
                    }
                    loginViewModel.signUp(email: email, password: password) {
                        user in userViewModel.addUser(id: user?.uid ?? "None", username: "hi", firstName: firstName, lastName: lastName, biography: bio)
                    }
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.blue)
                })
                NavigationLink("Already have an account? Log in", destination: LoginScreen())
            }
        .background(Color.yellow)
        
    }
}


struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
