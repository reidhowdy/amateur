import SwiftUI

struct AskFeed: View {
    @State private var showingDetail = false
    
    @StateObject var askViewModel = AskViewModel()
    
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
            
            GeometryReader { geometry in
            ScrollView {
                    ForEach(askViewModel.filterAsks(searchText: searchText)) { ask in
                        AskRow(ask: ask, askViewModel: askViewModel) //passing into
                    }
                    
                    HStack {
                        Spacer()
                        Text("\(askViewModel.askList.count) Asks")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Asks") //using a modifier from NavigationView
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
