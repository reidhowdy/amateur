import SwiftUI

struct UserAsks: View {
    var askViewModel = AskViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            askViewModel.getAsks(for: userAuthInfo.user!.uid)
        }
    }
        
}

struct UserAsks_Previews: PreviewProvider {
    static var previews: some View {
        UserAsks()
    }
}
