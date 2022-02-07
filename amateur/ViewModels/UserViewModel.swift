import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


class UserViewModel: ObservableObject {
    
    @Published var currentUser : User?
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
//    init () {
//        getUser(uid: (userAuthInfo.currentUser?.uid))
//    }
    
    func addUser(id: String, username: String, firstName: String, lastName: String, biography: String, profilePicture: String) {
        let uid = Auth.auth().currentUser?.uid
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid ?? "None" as String).setData([
                "username" : uid ?? "Hmm" as String,
                "firstName" : firstName,
                "lastName" : lastName,
                "dateJoined": Date.now,
                "biography": biography,
                "profilePicture": profilePicture
            ]) { error in
                if error == nil {
                    self.getUser(uid: id)
                }
                else {
                    print("Oops. There was an error.")
                }
            }
    }

    //After user logs in, fetch their document from the users collection and store it
    func getUser(uid: String?) { //can get rid of optionals tuff

        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid ?? "None" as String)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                DispatchQueue.main.async {
                    self.currentUser = User(
                                id: document["username"] as? String ?? "None",
                                username: document["username"] as? String ?? "None",
                                firstName: document["firstName"] as? String ?? "None",
                                lastName: document["lastName"] as? String ?? "None",
                                dateJoined: document["dateJoined"] as? Date ?? Date.now,
                                notifications: true,
                                biography: document["biography"] as? String ?? "None",
                                skillOffers: [],
                                skillAsks: [],
                                zipCode: 0,
                                profilePicture: document["profilePicture"] as? String ?? "None")
                }
            }
            else {
                print("Oops. There was an error.")
            }
        }
    }
    

    func editUser() {
        print("editing...")
    }
}
    


//Lower priority
//Want to get everything working before I worry about deleting things

//func deleteUser {
//
//}
