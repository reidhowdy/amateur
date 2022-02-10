import Foundation
import SwiftUI

struct imagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage? //we need this in order to communicate with the coordinator and with our other views
    @Binding var showImagePicker: Bool //var for determining when we should close/open imagePicker
    
    typealias UIViewControllerType = UIImagePickerController //this is an image picker controller
    typealias Coordinator = imagePickerCoordinator //this sets our coord, so that the two can communicate with each other
    
    //setting a default that says the source of our image is going to be the camera
    //this is just the default - we can pass the photo library instead!
    var sourceType:UIImagePickerController.SourceType = .camera
    
    //lets us communicate with the ImagePickerCoordinator
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType //sets source type
        picker.delegate = context.coordinator //sets delegate
        return picker
    }
    
    //allows us to comm with the imageCoordinator
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePickerCoordinator(image: $image, showImagePicker: $showImagePicker)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
    }
}


class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //need a binding variable - an optional UI image
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool //will determine if image picker is shown - we will set to false after an image is clicked on
    
    //when it initializes, it pass it upwards, binding-wise
    init(image:Binding<UIImage?>, showImagePicker: Binding<Bool>) {
        _image = image
        _showImagePicker = showImagePicker
    }
    
    //we are trying to unwrap the original image as a ui image
    //if we are successful, we will take the image and pass it upwards, via image, to the binding, which passes it to the representable, which also lets us manipulate it in our swiftui views
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage { //picking the image
            image = uiimage //when the image is picked,
            showImagePicker = false //close the image picker
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showImagePicker = false
    }
    
}
