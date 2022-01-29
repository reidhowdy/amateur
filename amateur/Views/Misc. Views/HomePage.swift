import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            List { //probably change this to a VStack
                NavigationLink("Browse Available Offers",
                    destination: OfferFeed())
                NavigationLink("Browse Current Asks",
                    destination: AskFeed())
                NavigationLink("Post an Offer",
                    destination: OfferPost())
                NavigationLink("Post an Ask",
                    destination: AskPost())
            }
            .navigationTitle("Amateur")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
