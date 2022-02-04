import SwiftUI

struct UserAsks: View {
    var askViewModel = AskViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @ObservedObject var userViewModel = UserViewModel()
    
    var asks : [Ask] = []
    
    var body: some View {
        VStack {
            NavigationView { //wrapping my list in this makes the items clickable
                List {
                    ForEach(askViewModel.askListForUser) { ask in
                        AskRow(ask: ask) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(askViewModel.askListForUser.count) Asks")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("My Asks") //using a modifier from NavigationView
            }
        }
        .onAppear {
            askViewModel.getAsks(for: userAuthInfo.user?.uid ?? "None")
        }
    }
}

struct UserAsks_Previews: PreviewProvider {
    static var previews: some View {
        UserAsks()
    }
}
