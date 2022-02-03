import SwiftUI
import Firebase

struct SignupScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Create Account")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                Spacer()
                Image(systemName: "flame")
                    .foregroundColor(Color.white)
                    .scaleEffect(6)
                Spacer()
                
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
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return //return what? an error message?
                    }
                    loginViewModel.signUp(email: email, password: password) {
                        user in userViewModel.addUser(id: user?.uid ?? "None", username: "hi", firstName: firstName, lastName: lastName)
                    }
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.blue)
                })
                Spacer()
            }
        .background(Color.yellow)
        }
    }
}


struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
