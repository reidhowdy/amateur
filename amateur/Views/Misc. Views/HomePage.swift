import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            VStack{
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
                Text("Browse Success Stories")
                    .font(.title)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {
                            //can maybe take {} so I can wrap the whole yellow box in a nav link
                            NavigationLink("Success \($0)",
                                           destination: SuccessDetail())
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 300)
                                .background(Color.yellow)
                        }
                    }
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
