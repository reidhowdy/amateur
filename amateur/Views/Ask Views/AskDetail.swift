import SwiftUI

struct AskDetail: View {
    var ask: Ask 
    @ObservedObject var askViewModel: AskViewModel
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
    @State private var comment: String = ""
    
    @State private var isSaved: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
        ScrollView {
            VStack {
                Text(ask.title)
                    .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.1)
                    .font(.largeTitle)
                    .cornerRadius(30)
                    .background(Color.white)
                    .foregroundColor(Color.black)
        
                AsyncImage(
                    url: URL(string:ask.photo),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.5)
                            .cornerRadius(25)
                    },
                    placeholder: {
                        ZStack {
                            Rectangle()
                                .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.25)
                                .cornerRadius(25)
                                .foregroundColor(Color.white)
                            ProgressView()
                        }
                    }
                )
                
                Text(ask.description)
                    .font(.body)
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.15, alignment: .leading)
                    .font(.body)
                
                VStack {
                    HStack {
                        Text("Posted on:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text(ask.datePosted, style: .date)
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Materials:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text(ask.materialsNeeded)
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Location:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text(ask.locationPreferences)
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }

                    
                }
                Spacer()
                VStack {
                    Spacer()
                    Text("Comments")
                        .font(.title)
                        .fontWeight(.bold)
        
                    //this will act weird if a comment is duplicated
                    ForEach(ask.comments, id: \.self) { comment in
                        Text(comment)
                            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.05, alignment: .leading)
                    }
        
                    TextField("Comment", text: $comment)
                    Button("Post") {
                        askViewModel.addCommentToAsk(ask: ask, newComment: comment)
                        askViewModel.getAsks()
                        comment = ""
                    }
                        .padding()
                        .cornerRadius(25)
                        .background(Color.theme.Green4)
                        .foregroundColor(Color.white)
        
                }
                .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.30)
                }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("Logo")
                    .resizable()
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
                }
            
            ToolbarItem {
                Button {
                    if isSaved {
                        askViewModel.removeSavedToAsk(ask: ask, currentUserId: userAuthInfo.user?.uid ?? "")
                        isSaved = false
                    } else {
                        askViewModel.addSavedToAsk(ask: ask, currentUserId: userAuthInfo.user?.uid ?? "")
                        isSaved = true
                    }
            
            
                } label: {
                    if isSaved {
                        Label("Saved", systemImage: "star.fill")
                    } else {
                        Label("Save", systemImage: "star")
                    }
                }
                    .foregroundColor(Color.theme.Yellow3)
        }
        }
        }
        .onAppear {
            isSaved = ask.saved.contains(userAuthInfo.user?.uid ?? "")
        }
    }
}
