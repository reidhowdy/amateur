import SwiftUI

struct AskRow: View {
    var ask: Ask
    @ObservedObject var askViewModel: AskViewModel
    
    var body: some View {
        
        
        NavigationLink(destination: AskDetail(ask: ask, askViewModel: askViewModel)) {
            HStack {
                AsyncImage(
                    url: URL(string:ask.photo),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 200, maxHeight: 200)
                             .padding()
                    },
                    placeholder: {
                        ProgressView()
                            .frame(maxWidth: 200, maxHeight: 200)
                            .padding()
                    }
                )
                
                Spacer()
                VStack(alignment: .leading) {
                    Text(ask.title)
                        .font(.title)
                        .padding([.top, .leading, .trailing])
                        .foregroundColor(Color.theme.Blue3)
                    Text(ask.description)
                        .font(.subheadline)
                        .foregroundColor(Color.theme.Blue2)
                        .padding()
                }
//                .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.1)
                .frame(width: 200, height: 175, alignment: .leading)
                .border(Color.black)
                .padding()
//                .background(Color.theme.Yellow2)
            }
            .frame(width: 400, height: 200)
//            .background(Color.theme.Yellow1)
            .border(Color.black)

        }
    }
}
//struct AskRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AskRow()
//    }
//}
