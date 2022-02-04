import Foundation
import Firebase

class AskViewModel: ObservableObject {
    @Published var askList = [Ask]()
    @Published var askListForUser = [Ask]()
    
    func addAsk(title: String, typeOfAsk: String, estimatedTime: Float, datePosted: Date, description: String, materialsNeeded: String, locationPreferences: String, onlineOnly: Bool, username: String) {
        
        let db = Firestore.firestore()
        
        db.collection("asks")
            .addDocument(data: [
//                "id": id,
                "title": title,
                "typeOfAsk": typeOfAsk,
                "estimatedTime": estimatedTime,
                "datePosted": datePosted,
                "description": description,
                "materialsNeeded": materialsNeeded,
                "locationPreferences": locationPreferences,
                "onlineOnly": onlineOnly,
                "username": username
            ]) {error in
                if error == nil {
                    self.getAsks()
                } else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    //just like getUser(), pass in UID as a param
    //get asks for a specific user
    //the for is part of the function name
    //the name of this function is getAsks(for)
    func getAsks(for uid: String) {
        let db = Firestore.firestore()
//        let asksRef = db.collection("asks")
//        let query = asksRef.whereField("username", isEqualTo: uid)
        
        db.collection("asks").whereField("username", isEqualTo: uid)
            .getDocuments() {
                snapshot, error in
                            
                            if error == nil {
                                if let snapshot = snapshot {
                                    DispatchQueue.main.async {
                                        self.askListForUser = snapshot.documents.map { doc in
                                            return Ask(
                //                                id: doc.documentID,
                                                title: doc["title"] as? String ?? "None",
                                                typeOfAsk: doc["typeOfOffer"] as? String ?? "None",
                                                estimatedTime: doc["estimatedTime"] as? Float ?? 0.0,
                                                datePosted: doc["datePosted"] as? Date ?? Date.now, //needs to be changed
                                                description: doc["description"] as? String ?? "None",
                                                materialsNeeded: doc["materialsNeeded"] as? String ?? "None",
                                                locationPreferences: doc["locationPreferences"] as? String ?? "None",
                                                onlineOnly: doc["onlineOnly"] as? Bool ?? false,
                                                username: doc["username"] as? String ?? "None")
                                        }
                                    }
                                }
                            }
                            else {
                                print("Oops. There was an error.")
                            }
            }
    }
  
    func getAsks() {
        let db = Firestore.firestore()
        
        db.collection("asks").getDocuments() {
            snapshot, error in
            
                if error == nil {
                    
                    if let snapshot = snapshot {
                        DispatchQueue.main.async {
                            self.askList = snapshot.documents.map { doc in
                                return Ask(
                                    id: doc.documentID,
                                    title: doc["title"] as? String ?? "None",
                                    typeOfAsk: doc["typeOfOffer"] as? String ?? "None",
                                    estimatedTime: doc["estimatedTime"] as? Float ?? 0.0,
                                    datePosted: doc["datePosted"] as? Date ?? Date.now, //needs to be changed
                                    description: doc["description"] as? String ?? "None",
                                    materialsNeeded: doc["materialsNeeded"] as? String ?? "None",
                                    locationPreferences: doc["locationPreferences"] as? String ?? "None",
                                    onlineOnly: doc["onlineOnly"] as? Bool ?? false,
                                    username: doc["username"] as? String ?? "None"
                                )
                            }
                        }
                    }
                }
                else {
                    print("Oops. There was an error.")
            }
        }
    }
}
