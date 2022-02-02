import SwiftUI
import FirebaseAuth

//extract all of these into new files when I have everything working as needed
class LoginViewModel: ObservableObject {
    var userViewModel = UserViewModel()
    var signupScreen = SignupScreen()
    var uid = ""
    
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
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password, completion: {
            (result, error) -> Void in if (error == nil) {
                self.uid = Auth.auth().currentUser?.uid ?? "None"
                print(self.uid)
                
                DispatchQueue.main.async {
                    self.signedIn = true
                }
            }
        })
        //below is what I had before, without the completion handler
//        {
//            [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            //success
//            DispatchQueue.main.async {
//                self?.signedIn = true
//            }
//        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
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
