import SwiftUI

struct AskFeed: View {
    @State private var showingDetail = false
    
    @StateObject var askViewModel = AskViewModel()
    
    @State private var showingSheet = false //is post an ask presented?
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
        VStack {
            Image("Asks")
                .resizable()
                .scaledToFit()
                .frame(width: 125, alignment: .leading)
            
            ScrollView {
                
                    Button("Post your ask") {
                        showingDetail = true
                    }
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    .sheet(isPresented: $showingDetail) {
                        AskPost(isPresented: $showingDetail, askViewModel: askViewModel)
                    }
                
                
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
            .toolbar{

                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
                    }
                }
            }
        .searchable(text: $searchText, prompt: "Search")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { askViewModel.getAsks() }
        }
    }
}

struct AskFeed_Previews: PreviewProvider {
    static var previews: some View {
        AskFeed()
    }
}
