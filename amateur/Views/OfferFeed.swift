import SwiftUI

struct OfferFeed: View {
    var offers : [Offer] = [] //initializes an empty array that is made up of instances of Offer
    
    var body: some View {
        VStack {
            Text("Offers")
                .font(.largeTitle)
            
            List(offers) { offer in //idk if this range is correct
                VStack(alignment: .leading) {
                    Text(offer.title) //must use dot notation bc working w a struct(class)
                    Text(offer.description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                
            }
            Spacer()
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferFeed(offers: offerTestData) //passed in test data as offers
    }
}
