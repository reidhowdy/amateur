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
                Label("Asks", systemImage: "person.fill.questionmark")
            }
            .onAppear {
                askViewModel.getUsersSavedAsks(currentUserId: userAuthInfo.user?.uid ?? "")
            }
            
            Text("hi")
                .tabItem {
                    Label("Offers", systemImage: "person.wave.2.fill")
                }
            
            
            
            
            
        }
        
        
    }
}

struct UserSaved_Previews: PreviewProvider {
    static var previews: some View {
        UserSaved()
    }
}
