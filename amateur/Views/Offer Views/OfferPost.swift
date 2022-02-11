import SwiftUI

struct OfferPost: View {
    @Binding var isPresented: Bool
    @ObservedObject var offerViewModel: OfferViewModel //this is now being passed in from OfferFeed
    
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
    
    @State var photo: UIImage?
    var imageViewModel = ImageViewModel()
    
    var body: some View {
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
                
                ImageUpload(uploadingImage: $photo)
                
                Button(action: {
                    imageViewModel.uploadImage(image: photo) {
                        url, err in
                            offerViewModel.addOffer(title: title,
                                                    typeOfOffer: typeOfOffer,
                                                    estimatedTime: estimatedTime,
                                                    numSessions: numSessions,
                                                    datePosted: Date.now,
                                                    materialsNeeded: materialsNeeded,
                                                    description: description,
                                                    locationPreferences: locationPreferences,
                                                    onlineOnly: onlineOnly,
                                                    username: userAuthInfo.user?.uid ?? "Didn't pass in the UID as expected",
                                                    photo: url?.absoluteString ?? "",
                                                    comments: [], //this and saved are empty
                                                    saved: [])
                            isPresented = false
                       }
                }, label: {
                    Text("Post")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.theme.Green2)
                })
            }
            .navigationTitle("Post Your Offer")
    }
}

//struct OfferPost_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferPost()
//    }
//}
