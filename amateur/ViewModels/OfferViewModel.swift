import Foundation
import Firebase

class OfferViewModel: ObservableObject {
    @Published var offerList = [Offer]()
    @Published var offerListForUser = [Offer]()

    //Adds an instance of Offer to the db.
    func addOffer(title: String, typeOfOffer: String, estimatedTime: Float, numSessions: Int, datePosted: Date, materialsNeeded: String, description: String, locationPreferences: String, onlineOnly: Bool, username: String) {
        
        let db = Firestore.firestore()
        
        db.collection("offers")
            .addDocument(data: [
//                "id": id,
                "title": title,
                "typeOfOffer": typeOfOffer,
                "estimatedTime": estimatedTime,
                "numSessions": numSessions,
                "datePosted": datePosted,
                "materialsNeeded": materialsNeeded,
                "description": description,
                "locationPreferences": locationPreferences,
                "username": username,
                
            ]) { error in
                if error == nil {
                    self.getOffers()
                }
                else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    func getOffers(for uid: String) {
        let db = Firestore.firestore()
        
        db.collection("offers").whereField("username", isEqualTo: uid)
            .getDocuments() {
                snapshot, error in
                    if error == nil {
                        if let snapshot = snapshot {
                            DispatchQueue.main.async {
                                self.offerListForUser = snapshot.documents.map { doc in
                                    return Offer(
                                        id: doc.documentID,
                                        title: doc["title"]                             as? String ?? "None",
                                        typeOfOffer: doc["typeOfOffer"]                 as? String ?? "None",
                                        estimatedTime: doc["estimatedTime"]             as? Float ?? 0.0,
                                        numSessions: doc["numSessions"]                 as? Int ?? 0,
                                        datePosted: doc["datePosted"]                   as? Date ?? Date.now, //this default isn't right
                                        materialsNeeded: doc["materialsNeeded"]         as? String ?? "None",
                                        description: doc["description"]                 as? String ?? "None",
                                        locationPreferences: doc["locationPreferences"] as? String ?? "None",
                                        onlineOnly: doc["onlineOnly"]                   as? Bool ?? false,
                                        username: doc["username"]                       as? String ?? "None")
                                }
                            }
                        }
                    }
                    else {
                        print("Oops. There was an error.")
                    }
            }
    }
    

    //Gets data from all documents in the db and converts them to a list of Offers (offerList).
    func getOffers() {
        let db = Firestore.firestore() //ref to our db
        
        db.collection("offers").getDocuments() {
            snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.offerList = snapshot.documents.map { doc in
                            return Offer(
                                id: doc.documentID,
                                title: doc["title"]                             as? String ?? "None",
                                typeOfOffer: doc["typeOfOffer"]                 as? String ?? "None",
                                estimatedTime: doc["estimatedTime"]             as? Float ?? 0.0,
                                numSessions: doc["numSessions"]                 as? Int ?? 0,
                                datePosted: doc["datePosted"]                   as? Date ?? Date.now, //this default isn't right
                                materialsNeeded: doc["materialsNeeded"]         as? String ?? "None",
                                description: doc["description"]                 as? String ?? "None",
                                locationPreferences: doc["locationPreferences"] as? String ?? "None",
                                onlineOnly: doc["onlineOnly"]                   as? Bool ?? false,
                                username: doc["username"]                       as? String ?? "None"
                                )
                        }
                    }//DQ bracket
                }
            }
            else { //else, if there is an error
                print("Oops. There was an error.")
            }
        }
    }
}
