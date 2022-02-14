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
                        .foregroundColor(Color.black)
                    Text(ask.description)
                        .font(.subheadline)
                        .padding()
                        .foregroundColor(Color.black)
                    
                }
                .frame(width: 200, height: 175, alignment: .leading)
//                .border(Color.black)
                .padding()
            }
            .frame(width: 400, height: 200)
//            .border(Color.black)
        }
    }
}
