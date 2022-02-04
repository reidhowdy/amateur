import SwiftUI
import FirebaseAuth
import Firebase

//user views profile

struct UserProfile: View {
    //use @Envirnonment object
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
                
                Text("Member since: Date Here") //how to display date??
                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.yellow)
                        .frame(width: 300, height: 200)
                    VStack {
                        Text("Bio")
                        Text(userViewModel.currentUser?.biography ?? "Not displaying bio")
                    }
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
