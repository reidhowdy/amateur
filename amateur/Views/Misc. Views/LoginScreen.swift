import SwiftUI
import FirebaseAuth

//extract all of these into new files when I have everything working as needed
class LoginViewModel: ObservableObject {
    var userViewModel = UserViewModel()
    var signupScreen = SignupScreen()
    var uid = ""
    var user : FirebaseAuth.User? //optional var of type FireUser
    
    //creates a ref to the auth object
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        //currentUser is a property from firebase
        //if no one is logged in, it's nil
        return auth.currentUser != nil
    }
    
    //in signIn and signUp, I want to also call my db to create an instance of User
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {
            [weak self] result, error in //weak self prevents a mem leak
            guard result != nil, error == nil else {
                return 
            }
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
                self?.user = result?.user
            }
        }
    }
    
    func signUp(email: String,
                password: String,
                completion: @escaping(FirebaseAuth.User?) -> Void) { //completion is expecting to receive a function reference that takes an optional user and returns nothing
        auth.createUser(withEmail: email, password: password) {
                [weak self] result, error in //weak self prevents a mem leak
                guard result != nil, error == nil else {
                    return
                }
                //success
            completion(result?.user)
                DispatchQueue.main.async {
                    self?.signedIn = true
                    self?.user = result?.user
                }
            }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
        self.user = nil
    }
}

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Amateur")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                Spacer()
                Image(systemName: "flame")
                    .foregroundColor(Color.white)
                    .scaleEffect(6)
                Spacer()
                HStack {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                }
                HStack {
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                }
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
                        .background(Color.blue)
                })
                Spacer()
                //create account button
                NavigationLink("Create Account", destination: SignupScreen())
                    .padding()
            }
        .background(Color.yellow)
        
        }
        
    }
        
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
