import SwiftUI

struct OfferFeed: View {
    @StateObject var offerViewModel = OfferViewModel()
    
    @State private var showingDetail = false
    
    @State private var searchText = ""
    
    var offers : [Offer] = [] //i dont think  i ever use this

    var body: some View {
        VStack {
            Button("Post your offer") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) { //try to move this around?
                OfferPost(isPresented: $showingDetail, offerViewModel: offerViewModel) //passes around binding?
            }
            
            GeometryReader { geometry in
            ScrollView {
                ForEach(offerViewModel.filterOffers(searchText: searchText)) { offer in //check out map instead
                    
                    OfferRow(offer: offer, offerViewModel: offerViewModel) //passing into
                }
                HStack {
                    Spacer()
                    Text("\(offerViewModel.offerList.count) Offers")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        .navigationTitle("Offers") //using a modifier from NavigationView
        .toolbar{

            ToolbarItem(placement: .principal) {
//                        GeometryReader { geometry in

                Image("Logo")
                    .resizable()
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
//                    }
        }
        }
        .searchable(text: $searchText, prompt: "Search")
        }
        }
            .onAppear {
            offerViewModel.getOffers()
            }
    }
}



struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferFeed()
    }
}
