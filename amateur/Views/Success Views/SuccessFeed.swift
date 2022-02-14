import SwiftUI

struct SuccessFeed: View {
    @State private var showingDetail = false
    
    @StateObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    @State private var showingSheet = false //is post an ask presented?
    @State private var searchText = ""
    
    var body: some View {
        VStack {
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
                .toolbar{

                    ToolbarItem(placement: .principal) {
                        GeometryReader { geometry in
                        Image("Logo")
                            .resizable()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
                            }
                        }
                }
                .searchable(text: $searchText, prompt: "Search")
            
            Button("Post your success") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                SuccessPost(isPresented: $showingDetail, successViewModel: successViewModel)
            }
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
