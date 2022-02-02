import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


class UserViewModel: ObservableObject {
    //@Published var uid : String //when this changes, this change will be announced

    func addUser(id: String, username: String, firstName: String, lastName: String) {
        let uid = Auth.auth().currentUser?.uid
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .addDocument(data: [
                "username" : uid ?? "Hmm" as String,
                "firstName" : firstName,
                "lastName" : lastName,
                "dateJoined": Date.now
            ]) { error in
                if error == nil {
                    self.getUser()
                }
                else {
                    print("Oops. There was an error.")
                }
            }
    }

    //After user logs in, fetch their document from the users collection and store it
    func getUser() {
        let db = Firestore.firestore()
        
        //this code could be updated
        //because
        
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
