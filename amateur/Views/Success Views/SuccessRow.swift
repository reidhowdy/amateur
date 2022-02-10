import SwiftUI

struct SuccessRow: View {
    var success: Success
    @ObservedObject var successViewModel = SuccessViewModel()
    
    var body: some View {
        NavigationLink(destination: SuccessDetail(success: success)) {
            
            HStack {
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
                VStack() {
                    Text(success.title)
                        .padding([.top, .leading, .trailing])
                    Text(success.description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .bottom, .trailing])
                }
                .frame(width: 200, height: 175, alignment: .leading)
                .background(Color.theme.Yellow2)
            }
            .frame(width: 400, height: 200)
            .background(Color.theme.Yellow1)
        }
    }
}

//struct SuccessRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessRow()
//    }
//}
