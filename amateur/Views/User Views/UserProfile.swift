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
                    Text(userViewModel.currentUser?.firstName ?? "Not displaying First Name")
                    Text(userViewModel.currentUser?.lastName ?? "Not displaying Last Name")
                }
                .font(.largeTitle)
                .padding()
                
                AsyncImage(url: URL(string: userViewModel.currentUser?.profilePicture ?? ""))
                    .frame(width: 100, height: 100)
                    .cornerRadius(100)
                
                Text("Member since:") //how to display date??
                Text(userViewModel.currentUser?.dateJoined ?? Date.now, style: .date)
                
                Spacer()
                    VStack {
                        Text("Bio")
                        Text(userViewModel.currentUser?.biography ?? "Not displaying bio")
                            .background(RoundedRectangle(cornerRadius: 25)
                                .fill(Color.yellow)
                                .frame(width: 400, height: 200))
                    .padding()
                    
                    
                }
                
                //add page 2 to the "Create a User" page
                //Ask questions like skill asks, skill offers
                //then also make an EditProfile view
                
                //skill offers
//                VStack {
//                    Text("Skill Offers (no ability to add yet)")
//                  Text(userViewModel.currentUser?.skillOffers ?? [])
//                }
//                .padding()
//                //skill asks
//                VStack {
//                    Text("Skill Asks (no ability to add yet)")
//                  Text(userViewModel.currentUser?.skillAsks ?? [])
//                }
//                .padding()
                //notifications
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink("My Asks", destination: UserAsks())
                    Spacer()
                    NavigationLink("My Offers", destination: UserOffers())
                    Spacer()
                }
                
                Spacer()
                NavigationLink("Edit Profile", destination: UserEdit())
                
//                Button {
//                    userViewModel.getUser(uid: (userAuthInfo.currentUser?.uid))
//                } label: {
//                    Text("Fetch data")
//                }

                // move this around
                     
            }
            .navigationTitle("Profile")
            .onAppear {
                userViewModel.getUser(uid: userAuthInfo.user?.uid)
            }
            
            }
    }
    
//    func hi() {
//        var uid = $userAuthInfo.currentUser.uid
//
//        userViewModel.getUser(uid: uid)
//    }
}


struct UserProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        UserProfile()
            .environmentObject(LoginViewModel())
    }
}
