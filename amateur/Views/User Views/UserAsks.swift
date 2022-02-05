import SwiftUI

struct UserAsks: View {
    @StateObject var askViewModel = AskViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @StateObject var userViewModel = UserViewModel()
    
    var asks : [Ask] = []
    
    var body: some View {
        VStack {
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
                .navigationTitle("My Asks") 
            Button("Testing") {
                askViewModel.getAsks(for: userAuthInfo.user?.uid ?? "None")
                print(askViewModel.askListForUser)
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
