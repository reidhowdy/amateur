import Foundation
import SwiftUI
import Firebase

//Data for each indiv user


struct User: Identifiable, Codable {
    var id: String //use @DocumentID here?
    var username: String
    var firstName: String
    var lastName: String
    var dateJoined: Date
    var notifications: Bool
    var biography: String
    var skillOffers: Array<String>
    var skillAsks: Array<String>
    var zipCode: Int 
    
}


