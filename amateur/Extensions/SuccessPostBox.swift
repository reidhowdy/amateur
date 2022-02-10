import SwiftUI

struct SuccessPostBox: View {
    var body: some View {
        ZStack {
            Text("")
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 200, height: 200)
                .background(Color.theme.Yellow2)
                .cornerRadius(30)
            
            NavigationLink(destination: SuccessFeed()) {
                VStack {
                    Spacer()
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Text("See more & post your own")
                    Spacer()
                }
                .padding()
            }
            .foregroundColor(Color.theme.Green2)
                .font(.title)
                .frame(width: 190, height: 190)
                .background(Color.theme.Yellow3)
                .cornerRadius(30)
        }
    }
}

struct SuccessPostBox_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPostBox()
    }
}
