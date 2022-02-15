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
                VStack() {
                    Text(success.title)
                        .font(.title)
                        .padding([.top, .leading, .trailing])
                        .foregroundColor(Color.black)
                    Text(success.description)
                        .font(.subheadline)
                        .padding()
                        .foregroundColor(Color.black)
                }
                .frame(width: 200, height: 175, alignment: .leading)
                .padding()
            }
            .frame(width: 400, height: 200)
        }
    }
}
