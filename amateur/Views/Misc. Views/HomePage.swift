import SwiftUI

struct HomePage: View {
    @State private var showingProfile = false
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                List { //probably change this to a VStack?
                    NavigationLink("Browse Available Offers",
                        destination: OfferFeed())
                    NavigationLink("Browse Current Asks",
                        destination: AskFeed())
                    NavigationLink("Post an Offer",
                        destination: OfferPost())
                    NavigationLink("Post an Ask",
                        destination: AskPost())
                }
                Text("Browse Success Stories")
                    .font(.title)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) {
                            //can maybe take {} so I can wrap the whole yellow box in a nav link
                            NavigationLink("Success \($0)",
                                           destination: SuccessDetail())
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 200, height: 300)
                                .background(Color.yellow)
                        }
                    }
                }
                .navigationTitle("Amateur")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            userViewModel.getUser()
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
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
