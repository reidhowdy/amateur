import SwiftUI

struct SuccessBox: View {
    
    var success: Success
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var body: some View {
        ZStack {
            Text("")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .background(Color.theme.Green4)
                .cornerRadius(30)
            
            NavigationLink(destination: SuccessDetail(success: success)) {
                VStack {
                    Spacer()
                    
                    AsyncImage(
                        url: URL(string:success.photo),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 100, maxHeight: 100)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    Spacer()
                    Text(success.title)
                    Spacer()
                }
            }
            .foregroundColor(Color.black)
                .font(.title)
                .frame(width: 190, height: 190)
                .background(Color.white)
                .cornerRadius(30)
                .padding()
        }
    }
}

//struct SuccessBox_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessBox(success: successViewModel.success)
//    }
//}
