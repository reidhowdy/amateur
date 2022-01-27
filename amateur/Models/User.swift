import Foundation
import SwiftUI

//Data for each indiv user

struct User: Identifiable { //hashable, codable?
    var id: Int
    var username: String
    var firstName: String
    var lastName: String
    var dateJoined: Date
    var notifications: Bool
    var biography: String
    var skillOffers: String //but I want this to be an array
    var skillAsks: String //but I want this to be an array
    var zipCode: Int 
    
    //do I want to use an init() to initialize some values?
}

