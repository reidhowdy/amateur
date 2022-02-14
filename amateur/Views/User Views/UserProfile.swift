import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseStorage

//user views profile

struct UserProfile: View {
    @EnvironmentObject var userAuthInfo : LoginViewModel
 
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                HStack {
                    Text(userViewModel.currentUser?.firstName ?? "First Name")
                    Text(userViewModel.currentUser?.lastName ?? "Last Name")
                }
                .font(.largeTitle)
                    
                HStack {
                Text("Member since:")
                Text(userViewModel.currentUser?.dateJoined ?? Date.now, style: .date)
                }
                    .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.10)
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                AsyncImage(
                    url: URL(string:userViewModel.currentUser?.profilePicture ?? ""),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.30)
                    },
                    placeholder: {
                        ZStack {
                            Rectangle()
                                .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.30)
                                .cornerRadius(25)
                                .foregroundColor(Color.white)
                            ProgressView()
                        }
                    }
                )
                Spacer()
                
                
                
                Spacer()
                    VStack {
//                        Text("Bio")
                        Text(userViewModel.currentUser?.biography ?? "Not displaying bio")
                            .frame(width: geometry.size.width * 0.90, height: 200)
                            .border(Color.theme.Green4)
                            .cornerRadius(25)
                            .foregroundColor(Color.theme.Green4)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink("My Asks", destination: UserAsks())
                        .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.10)
                        .background(Color.theme.Green4)
                        .foregroundColor(Color.white)
                        .cornerRadius(75)
                    Spacer()
                    NavigationLink("My Offers", destination: UserOffers())
                        .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.10)
                        .background(Color.theme.Green4)
                        .foregroundColor(Color.white)
                        .cornerRadius(75)
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
                    }
                
                ToolbarItem {
                    NavigationLink(destination: UserSaved()) {
                        VStack {
                            Image(systemName: "star")
                            Text("Saved")
                                .font(.caption2)
                    }
                }
                    .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.10)
                    .foregroundColor(Color.theme.Green4)
                    .cornerRadius(75)
                }
                }
            .onAppear {
                userViewModel.getUser(uid: userAuthInfo.user?.uid)
            }
                
            }
        }
    }
}


struct UserProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        UserProfile()
            .environmentObject(LoginViewModel())
    }
}
