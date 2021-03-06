import SwiftUI

struct OfferFeed: View {
    @StateObject var offerViewModel = OfferViewModel()
    
    @State private var showingDetail = false
    
    @State private var searchText = ""
    
    var offers : [Offer] = [] //i dont think  i ever use this

    var body: some View {
        GeometryReader { geometry in
        VStack {
            Image("Offers")
                .resizable()
                .scaledToFit()
                .frame(width: 125, alignment: .leading)
            
            ScrollView {
                
                Button("Post your offer") {
                    showingDetail = true
                }
                    .font(.caption)
                    .foregroundColor(Color.gray)
                .sheet(isPresented: $showingDetail) { //try to move this around?
                    OfferPost(isPresented: $showingDetail, offerViewModel: offerViewModel)
                }
                
                ForEach(offerViewModel.filterOffers(searchText: searchText)) { offer in
                    OfferRow(offer: offer, offerViewModel: offerViewModel)
                    Rectangle()
                        .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.002)
                }
                HStack {
                    Spacer()
                    Text("\(offerViewModel.offerList.count) Offers")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        .toolbar{

            ToolbarItem(placement: .principal) {
                Image("Logo")
                    .resizable()
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
                }
            }
        
        }
        .searchable(text: $searchText, prompt: "Search")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { offerViewModel.getOffers() }
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferFeed()
    }
}
