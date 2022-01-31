import SwiftUI

struct AskFeed: View {
    @ObservedObject var askViewModel = AskViewModel()
    
    var asks : [Ask] = []
    
    var body: some View {
        VStack {
            NavigationView { //wrapping my list in this makes the items clickable
                List {
                    ForEach(askViewModel.askList) { ask in
                        AskRow(ask: ask) //passing into
                    }
                    HStack {
                        Spacer()
                        Text("\(askViewModel.askList.count) Asks")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Asks") //using a modifier from NavigationView
            }
        }
        .onAppear {
            askViewModel.getAsks()
        }
    }
}

struct AskFeed_Previews: PreviewProvider {
    static var previews: some View {
        AskFeed()
    }
}
