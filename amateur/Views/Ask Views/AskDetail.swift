import SwiftUI

struct AskDetail: View {
    var ask: Ask //the var ask is empty, but it will be an instance of Ask when used
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
                        Text("Here it is")
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }
                    
                    
//                    HStack {
//                        Text("Offered by:")
//                            .fontWeight(.bold)
//                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
//                        Text("Here it is")
//                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
//                    }
                    
                    HStack {
                        Text("Materials:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text(ask.materialsNeeded)
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Estimated Time:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text("\(ask.estimatedTime, specifier: "%.2f") hours")
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
//                            .border(Color.black)
        
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

//struct AskDetail_Previews: PreviewProvider {
//    var askEx: Ask
//    var ask: Ask
//    
//    static var previews: some View {
//        AskDetail(ask: askEx)
//    }
//}


//
//ScrollView {
//    VStack {
//        Text(ask.title)
//            .frame(width: 400, height: 100)
//            .background(Color.theme.Blue1)
//            .font(.largeTitle)
//            .foregroundColor(Color.theme.Yellow1)
//            .cornerRadius(30)
//
//        AsyncImage(
//            url: URL(string:ask.photo),
//            content: { image in
//                image.resizable()
//                     .aspectRatio(contentMode: .fit)
//                     .frame(maxWidth: 300, maxHeight: 300)
//                     .cornerRadius(25)
//                     .padding()
//            },
//            placeholder: {
//                ProgressView()
//            }
//        )
//
//        VStack {
//            Spacer()
//            Text(ask.description)
//                .padding()
//            Spacer()
//            Text("Date Posted: Date Hereeeeeeeeeeee")
//                .padding()
//                .frame(width: 350, height: 50)
//                .background(Color.theme.Brown1)
//                .foregroundColor(Color.theme.Blue3)
//            Spacer()
//        }
//            .frame(width: 400, height: 200)
//            .background(Color.theme.Blue1)
//            .font(.body)
//            .foregroundColor(Color.theme.Yellow1)
//            .cornerRadius(30)
//
//        VStack {
//            HStack {
//                Text("Offered by:")
//                    .frame(width: 150, height: 25, alignment: .leading)
//                    .background(.white)
//                Text("I didnt collect this info oops")
//                    .frame(width: 225, height: 25)
//                    .background(Color.theme.Blue1)
//
//            }
//
//            HStack {
//                Text("Materials Needed:")
//                    .frame(width: 150, height: 25, alignment: .leading)
//                    .background(.white)
//                Text(ask.materialsNeeded)
//                    .frame(width: 225, height: 25)
//                    .background(Color.theme.Blue1)
//            }
//
//            HStack {
//                Text("Estimated Time:")
//                    .frame(width: 150, height: 25, alignment: .leading)
//                    .background(.white)
//                Text(String(ask.estimatedTime))
//                    .frame(width: 225, height: 25)
//                    .background(Color.theme.Blue1)
//            }
//
//            HStack {
//                Text("Location:")
//                    .frame(width: 150, height: 25, alignment: .leading)
//                    .background(.white)
//                Text(ask.locationPreferences)
//                    .frame(width: 225, height: 25)
//                    .background(Color.theme.Blue1)
//            }
//        }
//        Spacer()
//        VStack {
//            Spacer()
//            Text("Comments")
////                    Form {
//
////                    }
//
//            Spacer()
//
//            //this will act weird if a comment is duplicated
//            ForEach(ask.comments, id: \.self) { comment in
//                Text(comment)
//                    .padding()
////                            .alignment(.leading)
//            }
//
//            TextField("Comment", text: $comment)
//            Button("Post") {
//                askViewModel.addCommentToAsk(ask: ask, newComment: comment)
//                askViewModel.getAsks()
//            }
//                .frame(width: 50, height: 25)
//                .cornerRadius(25)
//                .foregroundColor(Color.theme.Brown1)
//                .background(Color.theme.Brown3)
//
//
//        }
//        .frame(width: 400, height: 200)
//    }
//}
//.toolbar {
//    Button {
//        if isSaved {
//            askViewModel.removeSavedToAsk(ask: ask, currentUserId: userAuthInfo.user?.uid ?? "")
//            isSaved = false
//        } else {
//            askViewModel.addSavedToAsk(ask: ask, currentUserId: userAuthInfo.user?.uid ?? "")
//            isSaved = true
//        }
//
//
//    } label: {
//        if isSaved {
//            Label("Saved", systemImage: "star.fill")
//        } else {
//            Label("Save", systemImage: "star")
//        }
//    }
//        .foregroundColor(Color.theme.Yellow3)
//}
//.onAppear {
//    isSaved = ask.saved.contains(userAuthInfo.user?.uid ?? "")
//}
//}
