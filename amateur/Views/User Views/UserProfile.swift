import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseStorage

//user views profile

struct UserProfile: View {
    @EnvironmentObject var userAuthInfo : LoginViewModel //telling it the type
    //wherever i use this, i can get my uid like below in the onAppear
    
    //tells swift that whatever wa passed in as that env object, assign this to that variable
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Text(userViewModel.currentUser?.firstName ?? "First Name")
                    Text(userViewModel.currentUser?.lastName ?? "Last Name")
                }
                .font(.largeTitle)
                .padding()
                
                AsyncImage(
                    url: URL(string:userViewModel.currentUser?.profilePicture ?? ""),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 100, maxHeight: 100)
                             .cornerRadius(100)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(maxWidth: 100, maxHeight: 100)
                    }
                )
                
                
                Text("Member since:") //how to display date??
                Text(userViewModel.currentUser?.dateJoined ?? Date.now, style: .date)
                
                Spacer()
                    VStack {
                        Text("Bio")
                        Text(userViewModel.currentUser?.biography ?? "Not displaying bio")
                            .background(
                                RoundedRectangle(cornerRadius: 25)
//                            .fill(Color.white)
                            .frame(width: 400, height: 200)
                                    .border(Color.theme.Green4)
                                    .cornerRadius(25)
                                    .foregroundColor(Color.theme.Green4)
                            
                            
                            )
                    .padding()
                    
                    
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink("My Asks", destination: UserAsks())
                        .frame(width: 100, height: 50)
                        .background(Color.theme.Green4)
                        .padding()
                        .foregroundColor(Color.white)
                        .cornerRadius(75)
                    Spacer()
                    NavigationLink("My Offers", destination: UserOffers())
                        .frame(width: 100, height: 50)
                        .background(Color.theme.Green4)
                        .padding()
                        .foregroundColor(Color.white)
                        .cornerRadius(75)
                    Spacer()
                    NavigationLink("My Saved Items", destination: UserSaved())
                        .frame(width: 100, height: 50)
                        .background(Color.theme.Green4)
                        .padding()
                        .foregroundColor(Color.white)
                        .cornerRadius(75)
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .onAppear {
                userViewModel.getUser(uid: userAuthInfo.user?.uid)
            }
            
        }
    }
}


struct UserProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        UserProfile()
            .environmentObject(LoginViewModel())
    }
}
