import Foundation
import SwiftUI

//data for each offer

struct Offer: Identifiable { //hashable and codable?
    var id: String
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

let offerTestData = [
    Offer(id: "123", title: "Learn 2 Felt", typeOfOffer: "fiber craft", estimatedTime: 1.5, numSessions: 3, datePosted: Date.now, materialsNeeded: "felting wool, felting needle, dense sponge", description: "felting 4 beginners ~~ let me teach you how to felt a little country mouse", locationPreferences: "online or in person", onlineOnly: false, username: "coolthem555"),
    Offer(id: "124", title: "This Is The Title", typeOfOffer: "this is the type of offer", estimatedTime: 5.3, numSessions: 2, datePosted: Date.now, materialsNeeded: "luck and good intentions", description: "beep bop this is my description", locationPreferences: "just online please", onlineOnly: true, username: "coffeeluvr123")
]
