import SwiftUI

struct HomePage: View {
    @State private var showingProfile = false
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var successes : [Success] = []
    
    var body: some View {
        ZStack {
            
            NavigationView {
                VStack {
                Spacer()
                    VStack {
                        Spacer()
                        NavigationLink("Offers",
                                       destination: OfferFeed())
                            .padding()
                            .foregroundColor(Color.theme.Green1)
                            .frame(width: 200, height: 100)
                            .background(Color.theme.Green3)
                            .font(.largeTitle)
                            .cornerRadius(100)
                        Spacer()
                        NavigationLink("Asks",
                                       destination: AskFeed())
                            .padding()
                            .foregroundColor(Color.theme.Blue1)
                            .frame(width: 200, height: 100)
                            .background(Color.theme.Blue3)
                            .font(.largeTitle)
                            .cornerRadius(100)
                        Spacer()
                    }
                Spacer()
                    Text("Success Stories")
                        .font(.title)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(successViewModel.successList) { success in
                                SuccessBox(success: success)
                            }
                            SuccessPostBox()
                        }
                    }
                    
                    .navigationTitle("Amateur")
                    .foregroundColor(Color.theme.Brown2)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
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
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
