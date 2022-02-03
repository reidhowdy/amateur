import Foundation
import SwiftUI

//the id should be the User ID
//(the user that posted it). so, the currentUser
struct Success: Identifiable, Codable {
    var id : String //UID
    var title: String
    var description: String
    var photo: String
    
}
