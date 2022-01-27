import Foundation
import SwiftUI

//data for each offer

struct Offer: Identifiable { //hashable and codable?
    var title: String
    var typeOfOffer: String //selected from a list
    var estimatedTime: Float //in hours --should there be one var for hours, one var for minutes?
    var numSessions: Int //num of est. sessions
    var datePosted: Date //date the offer was posted
    var materialsNeeded: String //materials needed to participate
    var description: String //description of the offer
    var locationPreferences: String //how can I make this a dict like this
    //[onlineOnly: bool, onlineOk: bool, onlinePreferred: bool, inPersonOnly: bool, inPersonOk: bool, inPersonPreferred: bool]
    var onlineOnly: Bool
    var username: String //a FK from User
    
}
