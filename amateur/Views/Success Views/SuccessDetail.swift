import SwiftUI

struct SuccessDetail: View {
    var successViewModel = SuccessViewModel()
    var success: Success
    
    var body: some View {
        VStack {
            Text(success.title)
                .font(.largeTitle)
            Spacer()
            AsyncImage(
                url: URL(string: success.photo),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 300, maxHeight: 300)
                         .cornerRadius(25)
                         .padding()
                },
                placeholder: {
                    ProgressView()
                }
            )
            Spacer()
            Text(success.description)
                .padding()
            Spacer()
                
        }
    }
}

//struct SuccessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessDetail(success: success)
//    }
//}
