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
//                        Image("Offers")
                        
//                        NavigationLink("Offers",
//                                       destination: OfferFeed())
//                            .padding()
//                            .foregroundColor(Color.black)
//                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
//                            .background(Color.white)
//                            .font(.largeTitle)
                        
                        NavigationLink(destination: OfferFeed()) {
                            HStack {
                                Image("Offers")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.65, alignment: .leading)
                                Text("Browse what's on offer, post your own offer, and ")
                                    .frame(width: geometry.size.width * 0.25, alignment: .trailing)
                                    .foregroundColor(Color.black)
                                    .font(.caption2)
                            }
                            .frame(width: geometry.size.width * 0.90)
                        }
                        Spacer()
                        NavigationLink(destination: AskFeed()) {
                            HStack {
                                Image("Asks")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.55, alignment: .leading)
                                Rectangle()
                                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10, alignment: .leading)
                                    .background(Color.white)
                                    .foregroundColor(Color.white)
                                Text("Browse all asks and post your own.")
                                    .frame(width: geometry.size.width * 0.25, alignment: .trailing)
                                    .foregroundColor(Color.black)
                                    .font(.caption2)
                            }
                            .frame(width: geometry.size.width * 0.90)
                        }

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
