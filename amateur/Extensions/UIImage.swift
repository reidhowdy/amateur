import SwiftUI

extension UIImage {
    func aspectFittedToHeight(_ newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        let renderer = UIGraphicsImageRenderer(size: newSize)

        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}

func compressImage(image: UIImage) -> UIImage {
        let resizedImage = image.aspectFittedToHeight(200)

        return resizedImage
}

//Then, use the built-in jpegData(compressionQuality:) function to convert your UIImage into JPEG, which will reduce the file size, and compress the quality of the image. It will return a data object, containing the image, and you'll be able to save to your database.
//
//func compressImage(image: UIImage) -> UIImage {
//        let resizedImage = image.aspectFittedToHeight(200)
//        resizedImage.jpegData(compressionQuality: 0.2) // Add this line
//
//        return resizedImage
//}
//The compressionQuality is a CGFloat between 0 and 1, 1 being the highest quality possible and 0 the lowest quality. If you don't need your users' profile pictures to be high-quality, you can set it to 0.1 or 0.2 so the file size is at its lowest.


