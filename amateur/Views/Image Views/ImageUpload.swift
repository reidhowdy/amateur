//split out into viewModel

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
                }
//                Spacer()
//                //downloading image
//                if downloadingImage != nil {
//                    Image(uiImage: downloadingImage!)
//                        .resizable()
//                        .scaledToFit()
//                            .frame(width: 120, height: 120)
//                } else {
//                    Image(systemName: "star")
//                        .resizable()
//                        .scaledToFit()
//                            .frame(width: 120, height: 120)
//                }
            }.padding()
            //image picker button
            Button(action: {
                self.showActionSheet = true //when button is pressed, action sheet State is set to true
            }) {
                Text("Select Profile Picture")
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
            
            //button for uploading to the db
//            Button(action: { //when you click on upload image:
//                if let thisImage = self.uploadingImage { //we are just unwrapping the image
//                    uploadImage(image: thisImage) //and then that's what we pass in
//                } else {
//                    print("couldn't upload image")
//                }
//            }) {
//                Text("Upload Profile Picture")
//            }
            
            //button for downloading an image from the db
//            Button(action: { //when you click on download image: (the size i set is i megabite)
//                Storage.storage().reference().child("temp").getData(maxSize: 1 * 1024 * 1024) {
//                    //completion handler
//                    (imageData, err) in
//                        if let err = err { //if the error actually exists and isn't nil
//                            print("An error has occured. - \(err.localizedDescription)")
//                        } else { //if there was no error,
//                            if let imageData = imageData {
//                                self.downloadingImage = UIImage(data: imageData)
//                            } else {
//                                print("couldn't unwrap image data")
//                            }
//
//                        }
//                }
//            }) {
//                Text("Download Image")
//            }
        }
    }
}
//
//func uploadImage(image : UIImage?, completion: @escaping (URL?, Error?) -> Void) {
//    //if we are able to take the image that we fed in and get its jpeg data at a quality of 1, then...
//    if let image = image {
//        //what kind of error info does jpegData give me?
//        if let imageData = image.jpegData(compressionQuality: 1) { //the scale is 0 to 1
//            let storage = Storage.storage() //created ref to storage
//            let fileName = UUID().uuidString
//
//            let ref = storage.reference().child(fileName)
//
//            ref.putData(imageData, metadata: nil) {
//                //the completion handler is gonna feed us back data and error:
//                (data, err) in //how to use this?
//                    if let err = err { //if the error actually exists and isn't nil
//                        completion(nil, err)
//                        print("An error has occured. - \(err.localizedDescription)")
//                    } else { //if there was no error,
//                        print("image uploaded")
//                        //downloadURL takes a param called completion, which is the same type as my completion, I can just pass it in
//                        ref.downloadURL(completion: completion)
//                    }
//            }
//        } else {
//            completion(nil, nil)
//            print("something went wrong")
//        }
//    } else {//we didn't get an image, so we call completion
//        completion(nil, nil) //there was no url or error
//    }
//}

//needs to be in a ViewModel! can;t just be chilling here


//struct ImageUpload_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageUpload()
//    }
//}