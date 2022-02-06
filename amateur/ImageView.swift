import SwiftUI

struct ImageView: View {
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    @State var sourceType : UIImagePickerController.SourceType = .camera
    @State var image : UIImage?
    
    var body: some View {
        VStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                        .frame(width: 300, height: 300)
            } else {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                        .frame(width: 300, height: 300)
            }
            Button(action: {
                self.showActionSheet = true //when button is pressed, action sheet State is set to true
            }) {
                Text("Show image picker")
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
                imagePicker(image: self.$image, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                //imagePicker w the bindable image, which refers to the one up there
        }
        }
        
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
