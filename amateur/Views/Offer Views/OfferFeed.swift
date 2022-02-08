import SwiftUI

struct OfferFeed: View {
    @ObservedObject var offerViewModel = OfferViewModel()
    
    @State private var showingDetail = false
    
    @State private var searchText = ""
    
    var offers : [Offer] = []
//    var filteredOfferList : [Offer] = []
    
    var body: some View {
        VStack {
            Button("Post your offer") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) { //try to move this around?
                OfferPost(isPresented: $showingDetail) //passes around binding?
            }
            
                    ScrollView {
                    ForEach(offerViewModel.filterOffers(searchText: searchText)) { offer in //check out map instead
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
                .searchable(text: $searchText, prompt: "Search")
        
            
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


//orig text before trying to implement search bar

//import SwiftUI
//
//struct OfferFeed: View {
//    @ObservedObject var offerViewModel = OfferViewModel()
//
//    @State private var showingDetail = false
//
//    var offers : [Offer] = []
//
//    var body: some View {
//        VStack {
//            Button("Post your offer") {
//                showingDetail = true
//            }
//            .sheet(isPresented: $showingDetail) {
//                OfferPost(isPresented: $showingDetail) //passes around binding?
//            }
//
//                List {
//                    ForEach(offerViewModel.offerList) { offer in
//                    OfferRow(offer: offer) //passing into
//                    }
//                    HStack {
//                        Spacer()
//                        Text("\(offerViewModel.offerList.count) Offers")
//                            .foregroundColor(.secondary)
//                        Spacer()
//                    }
//                }
//                .navigationTitle("Offers") //using a modifier from NavigationView
//        }
//            .onAppear {
//            offerViewModel.getOffers()
//            }
//    }
//
//}
//
//
//
//struct OfferView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferFeed()
//    }
//}
