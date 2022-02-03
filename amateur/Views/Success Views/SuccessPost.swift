import SwiftUI

struct SuccessPost: View {
    @ObservedObject var successViewModel = SuccessViewModel()
    
    @State var title: String = ""
    @State var description: String = ""
//    @State var photo: String = "" use this if I implement photo upload
    var body: some View {
        NavigationView {
            Form {
                TextField("Title",
                          text: $title)
                TextField("Description",
                          text: $description)
                
                Button("Post", action: {
                    successViewModel.addSuccess(id: "None yet", title: title, description: description, photo: "None")
                })
            }
            .navigationTitle("Post Your Success")
        }
    }
}

struct SuccessPost_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPost()
    }
}
