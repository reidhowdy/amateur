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
                        Text("Bio (no ability to add bio yet)")
                        Text(userViewModel.currentUser?.biography ?? "Not displaying bio")
                    }
                    .padding()
                }
                //skill offers
                VStack {
                    Text("Skill Offers (no ability to add yet)")
//                  Text(userViewModel.currentUser?.skillOffers ?? [])
                }
                .padding()
                //skill asks
                VStack {
                    Text("Skill Asks (no ability to add yet)")
//                  Text(userViewModel.currentUser?.skillAsks ?? [])
                }
                .padding()
                //notifications
                
                NavigationLink("My Asks", destination: UserAsks())
                NavigationLink("My Offers", destination: UserOffers())
                
                
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
//            .onAppear(perform: userViewModel.getUser(uid: userAuthInfo.currentUser?.uid))
//                //wherever I u
//                //onAppear is like useEffect
//                //view appears and once it appears this code will run
           
            
            }
    }
}


struct UserProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        UserProfile()
            .environmentObject(LoginViewModel())
    }
}
