import SwiftUI

struct UserSaved: View {
    @StateObject var askViewModel = AskViewModel()
    @StateObject var offerViewModel = OfferViewModel()
    @StateObject var userViewModel = UserViewModel()
    
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
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
            
            ScrollView {
                ForEach(offerViewModel.offerListUserSaved) { offer in
                    OfferRow(offer:offer, offerViewModel: offerViewModel)
                }
            }
                .tabItem {
                    Label("Offers", systemImage: "person.wave.2.fill")
                }
                .onAppear {
                    offerViewModel.getUsersSavedOffers(currentUserId: userAuthInfo.user?.uid ?? "")
                }
        }
    }
}

struct UserSaved_Previews: PreviewProvider {
    static var previews: some View {
        UserSaved()
    }
}
