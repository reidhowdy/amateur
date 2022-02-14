import SwiftUI

struct SuccessPostBox: View {
    var body: some View {
        ZStack {
            Text("")
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 200, height: 200)
                .background(Color.theme.Green4)
                .cornerRadius(30)
            
            NavigationLink(destination: SuccessFeed()) {
                VStack {
                    Spacer()
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Text("See all success stories and post your own")
                        .font(.body)
                    Spacer()
                }
                .padding()
            }
            .foregroundColor(Color.black)
                .font(.title)
                .frame(width: 190, height: 190)
                .background(Color.white)
                .cornerRadius(30)
        }
    }
}

struct SuccessPostBox_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPostBox()
    }
}
