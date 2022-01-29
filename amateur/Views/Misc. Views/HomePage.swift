import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            HStack {
                List { //probably change this to a VStack
                    NavigationLink("Browse Available Offers", destination: OfferFeed())
                    NavigationLink("Browse Current Asks",
                        destination: AskFeed())
                    Spacer()
                }
                .navigationTitle("Amateur")
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
