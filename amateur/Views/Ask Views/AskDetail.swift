import SwiftUI

struct AskDetail: View {
    var ask: Ask //the var ask is empty, but it will be an instance of Ask when used
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(ask.title)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .bottom])
                Spacer()
                Text(ask.description)
                    .font(.body)
                    .multilineTextAlignment(.trailing)
                    .padding(.all)
            }
            Spacer()
            Text("figure out how to format the date here")
            Text("Est time to complete: \(ask.estimatedTime) hours")
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .navigationTitle("Ask Details")
        .edgesIgnoringSafeArea(.all) //can change .all to things like .bottom, etc.
    }
}

struct AskDetail_Previews: PreviewProvider {
    static var previews: some View {
        Text("hi")
//        AskDetail(asks: asks)
    }
}
