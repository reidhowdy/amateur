import SwiftUI

//the general workflow:
//create state variable for the piece of data

//create a nav view
    //embed a Form within it
    //embed a TextField within that

struct AskPost: View {
    @ObservedObject var askViewModel = AskViewModel()
    @ObservedObject var userViewModel = UserViewModel()
    
    @State var title: String = ""
    @State var typeOfAsk: String = ""
    @State var estimatedTime: Float = 0.0
    //do not need datePosted state, it's always gonna be Date.now
    @State var description: String = ""
    @State var materialsNeeded: String = ""
    @State var locationPreferences: String = ""
    @State var onlineOnly: Bool = true
    @State var username: String = ""
    
    
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
                TextField("Username",
                          text: $username)
                
                
                
                Button("Post", action: {
                    askViewModel.addAsk(title: title, typeOfAsk: typeOfAsk, estimatedTime: estimatedTime, datePosted: Date.now, description: description, materialsNeeded: materialsNeeded, locationPreferences: locationPreferences, onlineOnly: onlineOnly, username: username)
                })
            }
            .navigationTitle("Post Your Ask")
        }
        
    }
}

struct AskPost_Previews: PreviewProvider {
    static var previews: some View {
        AskPost()
    }
}
