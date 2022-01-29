import SwiftUI

struct ContentView: View {
    //@ObservedObject var offerViewModel = OfferViewModel()
    
    var body: some View {
        LoginScreen()
//        OfferFeed(offers: offerViewModel.offerList)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
