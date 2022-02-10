import SwiftUI

struct UserSaved: View {
    @StateObject var askViewModel = AskViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        TabView {
            
            ScrollView {
                ForEach(askViewModel.askListUserSaved) { ask in
                    AskRow(ask:ask, askViewModel: askViewModel)
                }
            }
            .tabItem {
                Label("Asks", systemImage: "questionmark.app")
            }
            .onAppear {
                askViewModel.getUsersSavedAsks(currentUserId: userAuthInfo.user?.uid ?? "")
            }
            
            Text("hi")
                .tabItem {
                    Label("Offers", systemImage: "person")
                }
            
            
            
            
            
        }
        
        
    }
}

struct UserSaved_Previews: PreviewProvider {
    static var previews: some View {
        UserSaved()
    }
}
