import Foundation
import Firebase

class SuccessViewModel: ObservableObject {
    @Published var successList = [Success]()
    
    func addSuccess(id: String, title: String, description: String, photo: String) {
        let db = Firestore.firestore()
        
        db.collection("successes")
            .addDocument(data: [
                "id": id,
                "title": title,
                "description": description,
                "photo": photo
            ]) { error in
                if error == nil {
                    self.getSuccesses()
                }
                else {
                    print("Oops. There was an error.")
                }
        }
    }
    
    func getSuccesses() {
        let db = Firestore.firestore()
        
        db.collection("successes").getDocuments() {
            snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.successList = snapshot.documents.map { doc in
                            return Success(
                                id: doc["id"] as? String ?? "None",
                                title: doc["title"] as? String ?? "None",
                                description: doc["description"] as? String ?? "None",
                                photo: doc["photo"] as? String ?? "None"
                            )
                        }
                    }
                }
            }
            else {
                print("Oops. There was an error")
            }
        }
    }
}
