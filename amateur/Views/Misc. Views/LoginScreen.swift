import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Welcome to Amateur")
                Spacer()
                HStack {
                    Text("Username:")
                        .padding(.leading)
                    TextField("Username", text: $username)
                        .padding()
                }
                HStack {
                    Text("Password:")
                        .padding(.leading)
                    TextField("Password", text: $password)
                        .padding()
                }
                    NavigationLink("Login", destination: HomePage())
                        .padding(.all, 6.0)
                        .background(Color(.green))
                        .clipShape(Capsule())
                Spacer()
            }
        .background(Color.yellow)
        }
    }
        
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
