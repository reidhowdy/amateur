import SwiftUI

struct UserOffers: View {
    @StateObject var offerViewModel = OfferViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    @StateObject var userViewModel = UserViewModel()
    
    var offers : [Offer] = []
    
    var body: some View {
        VStack {
                List {
                    ForEach(offerViewModel.offerListForUser) { offer in
                        OfferRow(offer: offer, offerViewModel: offerViewModel) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(offerViewModel.offerListForUser.count) Offers")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("My Offers")
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
