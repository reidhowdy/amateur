import SwiftUI
import FirebaseAuth
import Firebase

//user views profile

struct UserProfile: View {
    //use @Envirnonment object
    @EnvironmentObject var userAuthInfo : LoginViewModel //telling it the type
    //tells swift that whatever wa passed in as that env object, assign this to that variable
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(userViewModel.currentUser?.username ?? "UID")
                Text(userViewModel.currentUser?.firstName ?? "Not displaying First Name")
                Text(userViewModel.currentUser?.lastName ?? "Not displaying Last Name")
                Button(action: {
                    userViewModel.getUser()
                }) {Text("Fetch Data")}
                
                Spacer()
                NavigationLink("Edit Profile", destination: UserEdit())
            }
            .navigationTitle("Profile")
        }
    }
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
