import Foundation
import Firebase

class AskViewModel: ObservableObject {
    @Published var askList = [Ask]()
    @Published var askListForUser = [Ask]()
    
    //Adds a document to asks in the db.
    func addAsk(title: String,
                typeOfAsk: String,
                estimatedTime: Float,
                datePosted: Date,
                description: String,
                materialsNeeded: String,
                locationPreferences: String,
                onlineOnly: Bool,
                username: String,
                photo: String,
                comments: [String]
    ) {
        
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
                "username": username,
                "photo": photo,
                "comments": comments
            ]) {error in
                if error == nil {
                    self.getAsks()
                } else {
                    print("Oops. There was an error.")
                }
            }
    }
    
    //Gets all documents in asks & appends to askList.
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
                                    username: doc["username"] as? String ?? "None",
                                    photo: doc["photo"] as? String ?? "None",
                                    comments: doc["comments"] as? [String] ?? []
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

    
    //Gets all documents in asks with matching UID & appends to askListForUser.
    func getAsks(for uid: String) {
        let db = Firestore.firestore()
        
        db.collection("asks").whereField("username", isEqualTo: uid)
            .getDocuments() {
                snapshot, error in
                    if error == nil { //inside the completion
                        if let snapshot = snapshot {
                            DispatchQueue.main.async {
                                self.askListForUser = snapshot.documents.map { doc in
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
                                        username: doc["username"] as? String ?? "None",
                                        photo: doc["photo"] as? String ?? "None",
                                        comments: doc["comments"] as? [String] ?? [] )
                                }
                            }
                        }
                    }
                    else {
                        print("Oops. There was an error.")
                    }
            }
    }
    
    func filterAsks(searchText: String) -> [Ask] {
        var filteredAskList : [Ask] = []
        
        if searchText.isEmpty {
            return askList
        } else {
            for ask in askList {
                if (ask.title.contains(searchText)) ||
                    (ask.description.contains(searchText)) {
                    filteredAskList.append(ask)
                }
            }
        }
        return filteredAskList
    }
    
    //Post a comment to a specific ask - this is called within AskDetail.
    func addCommentToAsk(ask: Ask, newComment: String) {
        //when I pass in ask here, I am passing in the instance without my new comments.
        //How do I force a reload whenever this is called?
        let db = Firestore.firestore()
        let currentComments: [String] = ask.comments
        var updatedComments: [String] = currentComments
        updatedComments.append(newComment)
        
        db.collection("asks").document(ask.id ?? "").setData(["comments": updatedComments], merge: true)
            {error in
                if error == nil {
                    self.getAsks()
                } else {
                    print("Oops. There was an error.")
                }
            }
    }
}


//"title": ask.title,
//"typeOfAsk": ask.typeOfAsk,
//"estimatedTime": ask.estimatedTime,
//"datePosted": ask.datePosted,
//"description": ask.description,
//"materialsNeeded": ask.materialsNeeded,
//"locationPreferences": ask.locationPreferences,
//"onlineOnly": ask.onlineOnly,
//"username": ask.username,
//"photo": ask.photo,
