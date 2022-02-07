import SwiftUI

struct SuccessBox: View {
    
    var success: Success
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var body: some View {
        NavigationLink(destination: SuccessDetail(success: success)) {
            Text(success.title)
        }
            .foregroundColor(.white)
            .font(.largeTitle)
            .frame(width: 200, height: 200)
            .background(Color.yellow)
            .cornerRadius(30)
    }
}

//struct SuccessBox_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessBox(success: successViewModel.success)
//    }
//}
