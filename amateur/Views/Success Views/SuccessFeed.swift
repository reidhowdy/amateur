import SwiftUI

struct SuccessFeed: View {
    @State private var showingDetail = false
    
    @StateObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    @State private var showingSheet = false //is post an ask presented?
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
        VStack {
            Image("Successes")
                .resizable()
                .scaledToFit()
                .frame(width: 200, alignment: .leading)
            
            Button("Post your success") {
                showingDetail = true
            }
            .font(.caption)
            .foregroundColor(Color.gray)
            .sheet(isPresented: $showingDetail) {
                SuccessPost(isPresented: $showingDetail, successViewModel: successViewModel)
            }
            
            ScrollView {
                ForEach(successViewModel.successList) { success in
                        SuccessRow(success: success) //passing into
                        Rectangle()
                            .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.002)
                    }
                    
                    HStack {
                        Spacer()
                        Text("\(successViewModel.successList.count) Successes")
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
        .onAppear { successViewModel.getSuccesses() }
    }
    }
}

struct SuccessFeed_Previews: PreviewProvider {
    static var previews: some View {
        SuccessFeed()
    }
}
