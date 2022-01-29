import SwiftUI


//a view in Swift UI is a struct that conforms to the view protocol
//collectively, my state variables and my models constitute my app's source of truth
struct OfferDetail: View {
    var offer: Offer
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(offer.title)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .bottom])
                Spacer()
                Text(offer.description)
                    .font(.body)
                    .multilineTextAlignment(.trailing)
                    .padding(.all)
                
            }
            Spacer()
            Text("figure out how to format the date here")
            Text("Est time to complete: \(offer.estimatedTime) hours")
                .multilineTextAlignment(.leading)
            Text("Number of Est. Sessions: \(offer.numSessions)")
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .navigationTitle("Offer Details")
        .edgesIgnoringSafeArea(.all) //can change .all to things like .bottom, etc.
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OfferDetail(offer: offerTestData[0])
        }
    }
}
