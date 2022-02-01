import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
   
    var body: some View {
        NavigationView {
            if loginViewModel.signedIn {
                Text("You are signed in.")
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
