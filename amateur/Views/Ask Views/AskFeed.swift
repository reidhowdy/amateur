import SwiftUI

struct AskFeed: View {
    var asks : [Ask] = []
    
    var body: some View {
        VStack {
            NavigationView { //wrapping my list in this makes the items clickable
                List {
                    ForEach(asks) { ask in
                        AskRow(ask: ask) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(offerViewModel.offerList.count) Offers")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Offers") //using a modifier from NavigationView
            }
        }
        .onAppear {
            offerViewModel.getOffers()
        }
        
        
        
        
        
        
        
    }
}

struct AskFeed_Previews: PreviewProvider {
    static var previews: some View {
        AskFeed()
    }
}

//I should put this in a new file
//I made this a subview - so now the loop is passing in one instance of Offer from my list of offers
struct AskRow: View {
    var ask: Ask
    @ObservedObject var askViewModel = AskViewModel()
    
    var body: some View {
        NavigationLink(destination: AskDetail(ask: ask)) {
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "heart")
                        .foregroundColor(.yellow)
                    Text("the ask title goes here") //must use dot notation bc working w a struct(class)
                }
                Text("the ask description goes here")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
