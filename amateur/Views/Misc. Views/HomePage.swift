import SwiftUI

struct HomePage: View {
    @State private var showingProfile = false
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    @State private var showActionSheet = false
    
    
    var body: some View {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink("Offers",
                                       destination: OfferFeed())
                            .padding()
                            .foregroundColor(Color.theme.Green1)
                            .frame(width: geometry.size.width * 0.4)
                            .background(Color.theme.Green3)
                            .font(.largeTitle)
                            .cornerRadius(100)
                        NavigationLink("Asks",
                                       destination: AskFeed())
                            .padding()
                            .foregroundColor(Color.theme.Blue1)
                            .frame(width: geometry.size.width * 0.4)
                            .background(Color.theme.Blue3)
                            .font(.largeTitle)
                            .cornerRadius(100)
                        Spacer()
                    }
                Spacer()
                    Text("Success Stories")
                        .font(.title)
                        .foregroundColor(Color.theme.Brown3)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(successViewModel.successList) { success in
                                SuccessBox(success: success)
                            }
                            SuccessPostBox()
                        }
                    }
                    .foregroundColor(Color.theme.Brown2)
                    
                    .sheet(isPresented: $showingProfile) {
                        UserProfile()
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showingProfile.toggle()
                        } label: {
                            Label("View Profile", systemImage: "figure.wave")
                                .foregroundColor(Color.theme.Green3)
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Amateur").font(.headline)
                            .foregroundColor(Color.theme.Blue3)
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            loginViewModel.signOut()
                        },
                               label: {
                            Label("Sign Out", systemImage: "figure.walk")
                                .foregroundColor(Color.theme.Green3)
                        })
                    }
                }
            }
                    .onAppear {
            successViewModel.getSuccesses()
    }
        
    }
//        .frame(height:50)
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
