import SwiftUI

struct OfferFeed: View {
    
    //creates a ref to my ViewModel
    @ObservedObject var offerViewModel = OfferViewModel()
    
    var offers : [Offer] = [] //initializes an empty array that is made up of instances of Offer
    
    var body: some View {
        VStack {
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
