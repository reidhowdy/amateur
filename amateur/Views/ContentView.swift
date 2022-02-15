import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
   
    var body: some View {
        NavigationView {
            if loginViewModel.signedIn {
                HomePage()
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
