import SwiftUI

struct AskFeed: View {
    @State private var showingDetail = false
    
    @StateObject var askViewModel = AskViewModel()
    
    var asks : [Ask] = []
    
    @State private var showingSheet = false //is post an ask presented?
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Button("Post your ask") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                AskPost(isPresented: $showingDetail, askViewModel: askViewModel)
            }
            
            ScrollView {
                    ForEach(askViewModel.filterAsks(searchText: searchText)) { ask in
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
                .searchable(text: $searchText, prompt: "Search")
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

//NavigationLink("Post an Ask",
//destination: AskPost())
