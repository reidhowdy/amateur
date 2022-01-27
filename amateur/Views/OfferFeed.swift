import SwiftUI

struct OfferFeed: View {
    var offers : [Offer] = [] //initializes an empty array that is made up of instances of Offer
    
    var body: some View {
        
            NavigationView { //wrapping my list in this makes the items clickable
                List {
                    ForEach(offers) { offer in
                    OfferRow(offer: offer) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(offers.count) Offers")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Offers") //using a modifier from NavigationView
                
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferFeed(offers: offerTestData) //passed in test data as offers
    }
}


//I made this a subview - so now the loop is passing in one instance of Offer from my list of offers
struct OfferRow: View {
    var offer: Offer
    
    var body: some View {
        NavigationLink(destination: OfferDetail(offer: offer)) {
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "heart")
                        .foregroundColor(.yellow)
                    Text(offer.title) //must use dot notation bc working w a struct(class)
                }
                Text(offer.description)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
