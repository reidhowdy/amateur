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
        GeometryReader { geometry in
            ScrollView {
                Spacer()
                VStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.70)

                            Text("Create Account")
                                .font(.title)
                                .foregroundColor(Color.black)
                        }
                        .padding()
                        Spacer()
                    VStack {
                        VStack {
                                Text("Choose Profile Picture:")
                                ImageUpload(uploadingImage: $profilePicture)
                                    .frame(height: geometry.size.width * 0.5)
                                Spacer()
                                TextField("First Name", text: $firstName)
                                        .disableAutocorrection(true)
                                        .autocapitalization(.none)
                                        .padding()
                                        .background(Color.white)
                                        .frame(width: geometry.size.width * 0.95)
                                TextField("Last Name", text: $lastName)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                                    .background(Color.white)
                                    .frame(width: geometry.size.width * 0.95)
                                TextField("Short bio", text: $bio)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                                    .background(Color.white)
                                    .frame(width: geometry.size.width * 0.95)
                                TextField("Email", text: $email)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                                    .background(Color.white)
                                    .frame(width: geometry.size.width * 0.95)
                                SecureField("Password", text: $password)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                                    .background(Color.white)
                                    .frame(width: geometry.size.width * 0.95)
                                
                                
                        }
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
                                .frame(width: geometry.size.width * 0.35)
                                .cornerRadius(8)
                                .background(Color.theme.Green4)
                        })
                    Spacer()
                        NavigationLink("Already have an account? Log in", destination: LoginScreen())
                    }
                
            }
            .background(Color.white)
            .ignoresSafeArea()
        }
//        .frame(width: 1, height: 1)
        
    }
}

struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
