import SwiftUI

struct SuccessDetail: View {
    var successViewModel = SuccessViewModel()
    var success: Success
    
    var body: some View {
        VStack {
            Text(success.title)
            Text(success.description)
        }
    }
}

//struct SuccessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessDetail()
//    }
//}
