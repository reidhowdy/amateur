import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


class UserViewModel: ObservableObject {
    
    func fetchCurrentUser() {
        guard let uid = Auth.auth().currentUser?.uid
            else { return }
    }
    
    
//    @Published var userList = [User]()
    //After new account is made, use that UID to create new document in users collection
    //so i actually only want to post the basics when the account is created this includes:
        //firstname, lastname, username, etc
    
    //once the account is made, user can go into 'edit profile' page in order to add all of the other things, which are:
            //, notifications: Bool, biography: String, skillOffers: Array<String>, skillAsks: Array<String>, zipCode: Int
    func addUser(id: String, username: String, firstName: String, lastName: String, dateJoined: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .addDocument(data: [
                "username" : username,
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
}
    


//Lower priority
//Want to get everything working before I worry about deleting things

//func deleteUser {
//
//}
