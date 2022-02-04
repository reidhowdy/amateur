import SwiftUI

struct UserOffers: View {
    @StateObject var offerViewModel = OfferViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @StateObject var userViewModel = UserViewModel()
    
    var offers : [Offer] = []
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(offerViewModel.offerListForUser) { offer in
                        OfferRow(offer: offer) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(offerViewModel.offerListForUser.count) Asks")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("My Asks") //using a modifier from NavigationView
            }
        }
        .onAppear {
            offerViewModel.getOffers(for: userAuthInfo.user?.uid ?? "None")
        }
    }
}

struct UserOffers_Previews: PreviewProvider {
    static var previews: some View {
        UserOffers()
    }
}
