import SwiftUI

struct AskPost: View {
    @Binding var isPresented: Bool //for determining if this sheet should be presented
    @ObservedObject var askViewModel: AskViewModel
    
    
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
    @State var title: String = ""
    @State var typeOfAsk: String = ""
    @State var estimatedTime: Float = 0.0
    @State var description: String = ""
    @State var materialsNeeded: String = ""
    @State var locationPreferences: String = ""
    @State var onlineOnly: Bool = true
    @State var username: String = ""
    
    @State var photo: UIImage?
    var imageViewModel = ImageViewModel()
    
    var body: some View {

            NavigationView {
                Form {
                    TextField("Title",
                              text: $title)
                    TextField("Type of ask",
                              text: $typeOfAsk)
    //                TextField("Est. time",
    //                          text: Float($estimatedTime))
                    TextField("Description",
                              text: $description)
                    TextField("Materials needed",
                              text: $materialsNeeded)
                    TextField("Location preferences",
                              text: $locationPreferences)
                    Toggle(isOn: $onlineOnly) {
                        Text("Online only")
                    }
                    ImageUpload(uploadingImage: $photo)
                    
                    Button(action: {
                        imageViewModel.uploadImage(image: photo) {
                            url, err in
                                askViewModel.addAsk(title: title,
                                                    typeOfAsk: typeOfAsk,
                                                    estimatedTime: estimatedTime,
                                                    datePosted: Date.now,
                                                    description: description,
                                                    materialsNeeded: materialsNeeded,
                                                    locationPreferences: locationPreferences,
                                                    onlineOnly: onlineOnly,
                                                    username: userAuthInfo.user?.uid ?? "Didn't pass in the UID as expected",
                                                    photo: url?.absoluteString ?? "")
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
                .navigationTitle("Post Your Ask")
            }
    }
}



//struct AskPost_Previews: PreviewProvider {
//    static var previews: some View {
//        AskPost()
//    }
//}
