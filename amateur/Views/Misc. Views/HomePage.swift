import SwiftUI

struct HomePage: View {
    @State private var showingProfile = false
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    @State private var showActionSheet = false
    
    @State var showSecondView = false
    
    var body: some View {
        Group {
            if showSecondView == false {
                SplashScreenBlob()
                    .onAppear {
                        successViewModel.getSuccesses()

                    }
            }
        
        else {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack {
                        Spacer()
                        
                        NavigationLink(destination: OfferFeed()) {
                            HStack {
                                Image("Offers")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.55, alignment: .leading)
                                Text("Browse what's on offer or post your offer")
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: geometry.size.width * 0.25, alignment: .trailing)
                                    .foregroundColor(Color.gray)
                                    .font(.caption2)
                                Image(systemName: "arrow.forward.square")
                                    .foregroundColor(Color.theme.Green4)
                                    .frame(width: geometry.size.width * 0.10, alignment: .trailing)
                            }
                            .frame(width: geometry.size.width * 0.90)
                        }
                        Spacer()
                        NavigationLink(destination: AskFeed()) {
                            HStack {
                                Image("Asks")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.45, alignment: .leading)
                                Rectangle()
                                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10, alignment: .leading)
                                    .background(Color.white)
                                    .foregroundColor(Color.white)
                                Text("Browse what's in demand or post your ask")
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: geometry.size.width * 0.25, alignment: .trailing)
                                    .foregroundColor(Color.gray)
                                    .font(.caption2)
                                Image(systemName: "arrow.forward.square")
                                    .foregroundColor(Color.theme.Green4)
                                    .frame(width: geometry.size.width * 0.10, alignment: .trailing)
                            }
                            .frame(width: geometry.size.width * 0.90)
                        }

                        Spacer()
                    }
                Spacer()
                    VStack {
                        Image("Successes")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.45)
                        
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
        }
        }
    
                    .onAppear {
                        successViewModel.getSuccesses()

                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                                    withAnimation {
                                        self.showSecondView = true
                                    }
                        }
                        
                    }
    }
        
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
