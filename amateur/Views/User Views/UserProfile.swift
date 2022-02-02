import SwiftUI
import FirebaseAuth
import Firebase

//user views profile

struct UserProfile: View {
    //use @Envirnonment object
    @EnvironmentObject var userAuthInfo : LoginViewModel //telling it the type
    //tells swift that whatever wa passed in as that env object, assign this to that variable
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text(userAuthInfo.user?.uid ?? "Not working")
                Text("")
                
                Spacer()
                NavigationLink("Edit Profile", destination: UserEdit())
            }
            .navigationTitle("firstName/lastName")
            
        }
    }
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
