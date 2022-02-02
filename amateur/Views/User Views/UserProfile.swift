import SwiftUI
import FirebaseAuth
import Firebase

//user views profile

struct UserProfile: View {

    let uid = Auth.auth().currentUser?.uid
    var body: some View {
        NavigationView {
            VStack {
                Text(uid ?? "Not working")
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
