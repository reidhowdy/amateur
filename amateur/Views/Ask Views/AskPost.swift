import SwiftUI

//the general workflow:
//create state variable for the piece of data

//create a nav view
    //embed a Form within it
    //embed a TextField within that

struct AskPost: View {
    @Binding var isPresented: Bool //for determining if this sheet should be presented
    
    @ObservedObject var askViewModel = AskViewModel()
    @ObservedObject var userViewModel = UserViewModel()
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
    @State var title: String = ""
    @State var typeOfAsk: String = ""
    @State var estimatedTime: Float = 0.0
    //do not need datePosted state, it's always gonna be Date.now
    @State var description: String = ""
    @State var materialsNeeded: String = ""
    @State var locationPreferences: String = ""
    @State var onlineOnly: Bool = true
    @State var username: String = ""
    
    @State var justPosted: Bool = false
    
    var body: some View {
//        if justPosted == false {
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
    //                TextField("Username",
    //                          text: $username)
                    
                    Button("Post", action: {
                        askViewModel.addAsk(title: title,
                                            typeOfAsk: typeOfAsk,
                                            estimatedTime: estimatedTime,
                                            datePosted: Date.now,
                                            description: description,
                                            materialsNeeded: materialsNeeded,
                                            locationPreferences: locationPreferences,
                                            onlineOnly: onlineOnly,
                                            username: userAuthInfo.user?.uid ?? "Didn't pass in the UID as expected")
                        justPosted = true
                        isPresented = false
                    })
                }
                .navigationTitle("Post Your Ask")
            }
//        }
        
//        if justPosted == true {
//            AskFeed()
//                .onAppear {
//                    askViewModel.getAsks()
//                }
//        }
        
    }
}



//struct AskPost_Previews: PreviewProvider {
//    static var previews: some View {
//        AskPost()
//    }
//}
