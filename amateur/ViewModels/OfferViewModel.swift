import Foundation
import Firebase

class OfferViewModel: ObservableObject {
    @Published var offerList = [Offer]()
    @Published var offerListForUser = [Offer]()
    @Published var offerListUserSaved = [Offer]()

    //Adds a document to offers in the db.
    func addOffer(title: String,
                  typeOfOffer: String,
                  estimatedTime: Float,
                  numSessions: Int,
                  datePosted: Date,
                  materialsNeeded: String,
                  description: String,
                  locationPreferences: String,
                  onlineOnly: Bool,
                  username: String,
                  photo: String,
                  comments: [String],
                  saved: [String]) {
        
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
                "photo": photo,
                "comments": comments,
                "saved": saved
            ]) { error in
                if error == nil {
                    self.getOffers()
                }
                else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    //Gets all documents in offers & appends to offerList.
    func getOffers() {
        let db = Firestore.firestore()
        
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
                                username: doc["username"]                       as? String ?? "None",
                                photo: doc["photo"]                             as? String ?? "",
                                comments: doc["comments"]                       as? [String] ?? [],
                                saved: doc["saved"]                             as? [String] ?? []
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
    
    //Gets all documents in offers with matching UID & appends to offerListForUser.
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
                                        username: doc["username"]                       as? String ?? "None",
                                        photo: doc["photo"]                             as? String ?? "",
                                        comments: doc["comments"]                       as? [String] ?? [],
                                        saved: doc["saved"]                             as? [String] ?? []
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
    
    //Filters offers in real time when text is typed into the search bar
    func filterOffers(searchText: String) -> [Offer] {
        var filteredOfferList : [Offer] = []
        
        if searchText.isEmpty {
            return offerList
        } else {
            for offer in offerList {
                if (offer.title.contains(searchText)) ||
                    (offer.description.contains(searchText)) {
                    filteredOfferList.append(offer)
                }
            }
        }
        return filteredOfferList
    }
    
    //Post a comment to a specific offer - this is called within OfferDetail
    func addCommentToOffer(offer: Offer, newComment: String) {
        //when I pass in ask here, I am passing in the instance without my new comments.
        //How do I force a reload whenever this is called?
        let db = Firestore.firestore()
        let currentComments: [String] = offer.comments
        var updatedComments: [String] = currentComments
        updatedComments.append(newComment)
        
        db.collection("offers").document(offer.id).setData(["comments": updatedComments], merge: true)
            {error in
                if error == nil {
                    self.getOffers()
                } else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    //User saves this offer - their UID is saved in the offer
    func addSavedToOffer(offer: Offer, currentUserId: String) {
        let db = Firestore.firestore()
        let currentSaved: [String] = offer.saved
        
        var updatedSaved: [String] = currentSaved
    
        updatedSaved.append(String(currentUserId)) //append current ID to list ..should i check to see if it's aready in it?
        
        db.collection("offers").document(offer.id).setData(["saved": updatedSaved], merge: true)
            {error in
                if error == nil {
                    self.getOffers()
                } else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    //Removed saved Offer
    func removeSavedToOffer(offer: Offer, currentUserId: String) {
        let db = Firestore.firestore()
        let currentSaved: [String] = offer.saved
        
        var updatedSaved: [String] = currentSaved
        
        updatedSaved = updatedSaved.filter { $0 != currentUserId } //sets updatedSaved to a list with the currentUserId filtered out
        
        db.collection("offers").document(offer.id).setData(["saved": updatedSaved], merge: true)
            {error in
                if error == nil {
                    self.getOffers()
                } else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    //Get all of the user's saved offers and puts them in offerListUserSaved
    func getUsersSavedOffers(currentUserId: String) {
        let db = Firestore.firestore()
        
        db.collection("offers").whereField("saved", arrayContains: currentUserId)
            .getDocuments() {
                snapshot, error in
                    if error == nil {
                        if let snapshot = snapshot {
                            DispatchQueue.main.async {
                                self.offerListUserSaved = snapshot.documents.map { doc in
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
                                        username: doc["username"]                       as? String ?? "None",
                                        photo: doc["photo"]                             as? String ?? "",
                                        comments: doc["comments"]                       as? [String] ?? [],
                                        saved: doc["saved"]                             as? [String] ?? []
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
