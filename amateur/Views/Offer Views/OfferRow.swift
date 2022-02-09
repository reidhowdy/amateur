import SwiftUI

struct OfferRow: View {
    var offer: Offer
    @ObservedObject var offerViewModel = OfferViewModel()
    
    var body: some View {
        
        NavigationLink(destination: OfferDetail(offer: offer)) {
            
            HStack {
                AsyncImage(
                    url: URL(string:offer.photo),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 100, maxHeight: 100)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                Spacer()
                VStack() {
                    Text(offer.title)
                        .padding([.top, .leading, .trailing])
                    Text(offer.description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .bottom, .trailing])
                }
                .frame(width: 200, height: 175, alignment: .leading)
                .background(Color.theme.Yellow2)
            }
            .frame(width: 400, height: 200)
            .background(Color.theme.Yellow1)
        }
    }
}


//struct OfferRow_Previews: PreviewProvider {
//   var offer: Offer
//    static var previews: some View {
//        OfferRow(offer: offer)
//    }
//}
