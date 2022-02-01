import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
   
    var body: some View {
        NavigationView {
            if loginViewModel.signedIn {
                VStack {
                    Text("You are signed in.")
                    
                    Button(action: {
                        loginViewModel.signOut()
                    },
                           label: {
                        Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .foregroundColor(Color.blue)
                    })
                    NavigationLink("Home Page", destination: HomePage())
                }
                
                
            }
            else {
                LoginScreen()
            }
        }
        .onAppear {
            loginViewModel.signedIn = loginViewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
