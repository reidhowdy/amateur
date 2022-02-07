import SwiftUI

struct OfferFeed: View {
    @ObservedObject var offerViewModel = OfferViewModel()
    
    @State private var showingDetail = false
    
    var offers : [Offer] = []
    
    var body: some View {
        VStack {
            Button("Post your offer") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                OfferPost(isPresented: $showingDetail) //passes around binding?
            }
            
                List {
                    ForEach(offerViewModel.offerList) { offer in
                    OfferRow(offer: offer) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(offerViewModel.offerList.count) Offers")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Offers") //using a modifier from NavigationView
        }
            .onAppear {
            offerViewModel.getOffers()
            }
    }
    
}



struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferFeed(offers: offerTestData)
//        OfferFeed(offers: offerViewModel.offerList) //was offerTestData
        //passed in test data as offers
    }
}


//I made this a subview - so now the loop is passing in one instance of Offer from my list of offers
