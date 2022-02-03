import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


class UserViewModel: ObservableObject {
    
    @Published var currentUser : User?
    
    init () {
        getUser() //populates currentUser upon loading
    }
    
    func addUser(id: String, username: String, firstName: String, lastName: String) {
        let uid = Auth.auth().currentUser?.uid
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid ?? "None" as String).setData([
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
//        @State var currentUser : User?
//        @State var doc : DocumentSnapshot
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
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
                                biography: "",
                                skillOffers: [],
                                skillAsks: [],
                                zipCode: 0)
                }
            }
            else {
                print("Oops. There was an error.")
            }
        }
    }
    
//    //what I was trying before
//    @State var currentUser : User
//    @State var doc : DocumentSnapshot
//    let db = Firestore.firestore()
//    let uid = Auth.auth().currentUser?.uid
//    let docRef = db.collection("users").document(uid ?? "None" as String)
//
//    docRef.getDocument { (document, error) in
//        if let document = document, document.exists {
//            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//            print("Document data: \(dataDescription)")
//            doc = document
//        } else {
//            print("Document does not exist")
//        }
//    }
//    //make an instance of User
//    currentUser = User(
//        id: doc["username"] as? String ?? "None",
//        username: doc["username"] as? String ?? "None",
//        firstName: doc["firstName"] as? String ?? "None",
//        lastName: doc["lastName"] as? String ?? "None",
//        dateJoined: doc["dateJoined"] as? Date ?? Date.now,
//        notifications: true,
//        biography: "",
//        skillOffers: [],
//        skillAsks: [],
//        zipCode: 0)
    
    func editUser() {
        print("editing...")
    }
}
    


//Lower priority
//Want to get everything working before I worry about deleting things

//func deleteUser {
//
//}
