import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        //have piece of state to track whether someone is logged in
        //if they are, show home page
        
        //look for login screen specific tutorials 
        
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
                        .navigationBarBackButtonHidden(true) //isn't working
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
