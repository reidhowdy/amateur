import SwiftUI

struct AskRow: View {
    var ask: Ask
    @ObservedObject var askViewModel = AskViewModel()
    
    var body: some View {
        NavigationLink(destination: AskDetail(ask: ask)) {
            
            HStack {
                Image(systemName: "photo.fill")
                    .resizable()
                    .frame(width: 100, height: 75, alignment: .leading)
                    .padding()
                Spacer()
                VStack() {
                    Text(ask.title)
                        .padding([.top, .leading, .trailing])
                    Text(ask.description)
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
//struct AskRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AskRow()
//    }
//}
