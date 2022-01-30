import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
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
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {
                            NavigationLink("Success \($0)",
                                           destination: SuccessDetail())
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 200)
                                .background(Color.yellow)
                        }
                    }
                }
                .navigationTitle("Success Stories")
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
