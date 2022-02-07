import SwiftUI

struct HomePage: View {
    @State private var showingProfile = false
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    var body: some View {
        NavigationView {
            VStack {
                 //probably change this to a VStack?
                    NavigationLink("Browse Available Offers",
                        destination: OfferFeed())
                    NavigationLink("Browse Current Asks",
                        destination: AskFeed())
                    NavigationLink("Post an Offer",
                        destination: OfferPost())
                    NavigationLink("Post an Ask",
                        destination: AskPost())
                    
                Text("Browse Success Stories")
                    .font(.title)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(successViewModel.successList) { success in
                            SuccessBox(success: success)
                        }
                            NavigationLink(destination: SuccessPost()) {
                                VStack {
                                    Image(systemName: "plus.app.fill")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(Color.white)
                                    Text("Post your success story")
                                }
                            }
                            .foregroundColor(.white)
                            .frame(width: 200, height: 200)
                            .background(Color.yellow)
                    }
                }
                
                .navigationTitle("Amateur")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
//                            userViewModel.getUser()
                            showingProfile.toggle()
                        } label: {
                            Label("View Profile", systemImage: "figure.wave")
                                .foregroundColor(Color.green)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            loginViewModel.signOut()
                        },
                               label: {
                            Label("Sign Out", systemImage: "figure.walk")
                                .foregroundColor(Color.green)
                        })
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    UserProfile()
                }
            }
        }
        .onAppear {
            successViewModel.getSuccesses()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
