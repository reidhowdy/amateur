import SwiftUI

struct OfferRow: View {
    var offer: Offer
    @ObservedObject var offerViewModel: OfferViewModel
    
    var body: some View {
        
        NavigationLink(destination: OfferDetail(offer: offer, offerViewModel: offerViewModel)) {
            
                HStack {
                    AsyncImage(
                        url: URL(string:offer.photo),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 100, maxHeight: 100)
                                 .padding()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    
                    Spacer()
                    VStack() {
                        Text(offer.title)
                            .font(.title)
                            .padding([.top, .leading, .trailing])
                        Text(offer.description)
                            .font(.subheadline)
                            .padding()
                    }
                    .frame(width: 200, height: 175, alignment: .leading)
//                    .border(Color.black)
                    .padding()
                }
                .frame(width: 400, height: 200)
//                .border(Color.black)
        }
    }
}
