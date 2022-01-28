import Foundation
import Firebase

class OfferViewModel: ObservableObject {
    @Published var list = [Offer]()
    
    func addOffer(id: String, title: String, typeOfOffer: String, estimatedTime: Float, numSessions: Int, datePosted: Date, materialsNeeded: String, description: String, locationPreferences: String, onlineOnly: Bool, username: String) {
        
        let db = Firestore.firestore()
        
        db.collection("")
    }
}
