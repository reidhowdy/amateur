import FirebaseAuth
import SwiftUI

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
//                self?.userViewModel.getUser() doesn't work
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
//                    self?.userViewModel.getUser() //trying this
                }
            }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
        self.user = nil
    }
}
