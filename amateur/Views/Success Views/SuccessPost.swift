import SwiftUI

struct SuccessPost: View {
    
    @Binding var isPresented: Bool
    @ObservedObject var successViewModel: SuccessViewModel
    var imageViewModel = ImageViewModel()
    
    @State var title: String = ""
    @State var description: String = ""
    
    @State var photo: UIImage?
    
    var body: some View {
//        NavigationView {
            Form {
                TextField("Title",
                          text: $title)
                TextField("Description",
                          text: $description)
                
                HStack {
                    Spacer()
                    ImageUpload(uploadingImage: $photo)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        imageViewModel.uploadImage(image: photo) {
                            url, err in
                            successViewModel.addSuccess(id: "None yet", title: title, description: description, photo: url?.absoluteString ?? "")
                               isPresented = false
                           }
                    }, label: {
                        Text("Post")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.theme.Green4)
                })
                    Spacer()
                }
            }
            .navigationTitle("Post Your Success")
//        }
    }
}

//struct SuccessPost_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessPost()
//    }
//}
