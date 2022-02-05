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
        } //when contentView loads, loginViewModel.signedIn is fetched and updated
        //it is then used to determine what the view is 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
