import SwiftUI

struct UserSaved: View {
    @StateObject var askViewModel = AskViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(askViewModel.askListUserSaved) { ask in
                    AskRow(ask:ask, askViewModel: askViewModel)
                }
            }
        }
        .onAppear {
            askViewModel.getUsersSavedAsks(currentUserId: userAuthInfo.user?.uid ?? "")
        }
    }
}

struct UserSaved_Previews: PreviewProvider {
    static var previews: some View {
        UserSaved()
    }
}
