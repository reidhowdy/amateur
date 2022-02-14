import SwiftUI
import FirebaseStorage

struct ImageUpload: View {
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    @State var sourceType : UIImagePickerController.SourceType = .camera
    @Binding var uploadingImage : UIImage?
    
    
    @State var downloadingImage : UIImage?
    
    var body: some View {
        
        VStack {
            HStack {
                //if/else displays the uploadingImage
                if uploadingImage != nil {
                    Image(uiImage: uploadingImage!)
                        .resizable()
                        .scaledToFit()
                            .frame(width: 120, height: 120)
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(Color.theme.Green4)
                }
            }.padding()
            //image picker button
            Button(action: {
                self.showActionSheet = true //when button is pressed, action sheet State is set to true
            }) {
                Text("Select Photo")
                    .frame(width: 125, height: 50)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
            }.actionSheet(isPresented: $showActionSheet) { //decides if isPresented is true or false
                //now, within the action sheet itself, here's what will appear:
                ActionSheet(title: Text("Add a picture to your post"),
                            message: nil,
                            buttons: [
                                .default(Text("Camera"), action: {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                }),
                                .default(Text("Photo Library"), action: {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                }),
                                .cancel() //dismisses the action sheet
                            ])
            }.sheet(isPresented: $showImagePicker) {
                imagePicker(image: self.$uploadingImage, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                //imagePicker w the bindable image, which refers to the one up there
            }
        }
    }
}

//struct ImageUpload_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageUpload()
//    }
//}
