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
                    VStack {
                        Spacer()
                        NavigationLink("Offers",
                                       destination: OfferFeed())
                            .padding()
                            .foregroundColor(Color.black)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .background(Color.white)
                            .font(.largeTitle)

                        NavigationLink("Asks",
                                       destination: AskFeed())
                            .padding()
                            .foregroundColor(Color.black)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                            .background(Color.white)
                            .font(.largeTitle)

                        Spacer()
                    }
                Spacer()
                    VStack {
                        Text("Success Stories")
                            .font(.title)
                            .foregroundColor(Color.black)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(successViewModel.successList) { success in
                                    SuccessBox(success: success)
                                }
                                SuccessPostBox()
                            }
                        }
                    }
                    
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
                                .foregroundColor(Color.theme.Green4)
                        }
                    }

                    ToolbarItem(placement: .principal) {
                        Image("Logo")
                            .resizable()
                            .frame(width: geometry.size.width * 0.5)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            loginViewModel.signOut()
                        },
                               label: {
                            Label("Sign Out", systemImage: "figure.walk")
                                .foregroundColor(Color.theme.Green4)
                        })
                    }
                }
            }
                    .onAppear {
            successViewModel.getSuccesses()
    }
//                    .overlay(SplashScreenBlob())
    }
//        .frame(height:50)
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
