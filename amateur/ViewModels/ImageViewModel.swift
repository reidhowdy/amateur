import Foundation
import SwiftUI
import FirebaseStorage

class ImageViewModel: ObservableObject {
    func uploadImage(image : UIImage?, completion: @escaping (URL?, Error?) -> Void) {
        //if we are able to take the image that we fed in and get its jpeg data at a quality of 1, then...
        if let image = image {
            //what kind of error info does jpegData give me?
            if let imageData = image.jpegData(compressionQuality: 1) { //the scale is 0 to 1
                let storage = Storage.storage() //created ref to storage
                let fileName = UUID().uuidString
                
                let ref = storage.reference().child(fileName)
                
                ref.putData(imageData, metadata: nil) {
                    //the completion handler is gonna feed us back data and error:
                    (data, err) in //how to use this?
                        if let err = err { //if the error actually exists and isn't nil
                            completion(nil, err)
                            print("An error has occured. - \(err.localizedDescription)")
                        } else { //if there was no error,
                            print("image uploaded")
                            //downloadURL takes a param called completion, which is the same type as my completion, I can just pass it in
                            ref.downloadURL(completion: completion)
                        }
                }
            } else {
                completion(nil, nil)
                print("something went wrong")
            }
        } else {//we didn't get an image, so we call completion
            completion(nil, nil) //there was no url or error
        }
    }
}
