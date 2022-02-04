//when post is pressed,
//I also want the user to be directed to the feed
//or they can have an option:
    //post another offer
    //or go see their post in the feed

import SwiftUI

struct OfferPost: View {
    @ObservedObject var offerViewModel = OfferViewModel()
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
    @State var title: String = ""
    @State var typeOfOffer: String = ""
    @State var estimatedTime: Float = 0.0
    @State var numSessions: Int = 0
    @State var materialsNeeded: String = ""
    @State var description: String = ""
    @State var locationPreferences: String = ""
    @State var onlineOnly: Bool = true //this isn't posting
    @State var username: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title",
                          text: $title)
                TextField("Type of offer",
                          text: $typeOfOffer)
//                TextField("Est. time",
//                          text: Float($estimatedTime))
//                TextField("Number of sessions",
//                          text: Int($numSessions))
                TextField("Description",
                          text: $description)
                TextField("Materials needed",
                          text: $materialsNeeded)
                TextField("Location preferences",
                          text: $locationPreferences)
                Toggle(isOn: $onlineOnly) {
                    Text("Online only")
                }
//                TextField("Username",
//                          text: $username)
                Button("Post", action: {
                    offerViewModel.addOffer(title: title,
                                            typeOfOffer: typeOfOffer,
                                            estimatedTime: estimatedTime,
                                            numSessions: numSessions,
                                            datePosted: Date.now,
                                            materialsNeeded: materialsNeeded,
                                            description: description,
                                            locationPreferences: locationPreferences,
                                            onlineOnly: onlineOnly,
                                            username: userAuthInfo.user?.uid ?? "Didn't pass in the UID as expected")
                })
            }
            .navigationTitle("Post Your Offer")
        }
    }
}

struct OfferPost_Previews: PreviewProvider {
    static var previews: some View {
        OfferPost()
    }
}
