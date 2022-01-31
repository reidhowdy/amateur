import SwiftUI

struct OfferRow: View {
    var offer: Offer
    @ObservedObject var offerViewModel = OfferViewModel()
    
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


//struct OfferRow_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferRow(offer: offer)
//    }
//}
