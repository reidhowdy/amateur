import Foundation
import Firebase

class AskViewModel: ObservableObject {
    @Published var askList = [Ask]()
    
    func addAsk() {
        let db = Firestore.firestore()
        
        db.collection("asks")
            .addDocument(data: [
                "title": "bla bla"
            
            
            ]) {error in
                if error == nil {
                    self.getAsks()
                } else {
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
                                id: <#T##String?#>,
                                title: <#T##String#>,
                                typeOfAsk: <#T##String#>,
                                estimatedTime: <#T##Float#>,
                                datePosted: <#T##Date#>,
                                description: <#T##String#>,
                                materialsNeeded: <#T##String#>,
                                locationPreferences: <#T##String#>,
                                onlineOnly: <#T##Bool#>,
                                username: <#T##String#>)
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
