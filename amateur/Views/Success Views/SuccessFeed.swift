import SwiftUI

struct SuccessFeed: View {
    @State private var showingDetail = false
    
    @StateObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    @State private var showingSheet = false //is post an ask presented?
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Button("Post your ask") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                SuccessPost(isPresented: $showingDetail, successViewModel: successViewModel)
            }
            
            ScrollView {
                ForEach(successViewModel.successList) { success in
                        SuccessRow(success: success) //passing into
                    }
                    
                    HStack {
                        Spacer()
                        Text("\(successViewModel.successList.count) Successes")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Successes") //using a modifier from NavigationView
                .searchable(text: $searchText, prompt: "Search")
        }
        .onAppear {
            successViewModel.getSuccesses()
        }
    }
}

struct SuccessFeed_Previews: PreviewProvider {
    static var previews: some View {
        SuccessFeed()
    }
}
