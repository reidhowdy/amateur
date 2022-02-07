import SwiftUI
import Firebase

struct SignupScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var bio: String = ""
    
    @State var profilePicture: UIImage?
    
    //get me the environment object from ContentView
    @EnvironmentObject var loginViewModel: LoginViewModel
    var userViewModel = UserViewModel()
    var imageViewModel = ImageViewModel()
    
    var body: some View {
            VStack {
                VStack {
                    Text("A  m  a  t  e  u  r")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.Blue2)
                    Text("Create Account")
                        .font(.title)
                        .foregroundColor(Color.theme.Blue1)
                }
                Spacer()
                VStack {
                    ImageUpload(uploadingImage: $profilePicture) //pass in my binding (profilePicture)
                    
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
                    imageViewModel.uploadImage(image: profilePicture) {
                        url, err in
                            loginViewModel.signUp(email: email, password: password) {
                                user in userViewModel.addUser(id: user?.uid ?? "None", username: "hi", firstName: firstName, lastName: lastName, biography: bio, profilePicture: url?.absoluteString ?? "")
                            }
                    }
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.theme.Green2)
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
