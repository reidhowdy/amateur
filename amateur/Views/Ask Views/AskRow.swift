import SwiftUI

struct AskRow: View {
    var ask: Ask
    @ObservedObject var askViewModel = AskViewModel()
    
    var body: some View {
        NavigationLink(destination: AskDetail(ask: ask)) {
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "heart")
                        .foregroundColor(.yellow)
                    Text(ask.title) 
                }
                Text(ask.description)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
//struct AskRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AskRow()
//    }
//}
