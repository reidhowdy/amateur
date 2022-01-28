import Foundation
import SwiftUI

struct Ask: Identifiable, Codable {
    var id: String?
    var title: String
    var typeOfAsk : String //selected from a predetermined list
    var estimatedTime: Float
    var datePosted: Date
    var description: String
    var materialsNeeded: String
    var locationPreferences: String //want to be dict?
    var onlineOnly: Bool
    var username: String //FK from User
}
