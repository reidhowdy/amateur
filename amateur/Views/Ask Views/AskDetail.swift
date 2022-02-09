import SwiftUI

struct AskDetail: View {
    var ask: Ask //the var ask is empty, but it will be an instance of Ask when used
    @StateObject var askViewModel = AskViewModel()
    
    @State var comment: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text(ask.title)
                    .frame(width: 400, height: 100)
                    .background(Color.theme.Blue1)
                    .font(.largeTitle)
                    .foregroundColor(Color.theme.Yellow1)
                    .cornerRadius(30)
                
                AsyncImage(
                    url: URL(string:ask.photo),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 300, maxHeight: 300)
                             .cornerRadius(25)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                VStack {
                    Spacer()
                    Text(ask.description)
                        .padding()
                    Spacer()
                    Text("Date Posted: Date Hereeeeeeeeeeee")
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color.theme.Brown1)
                        .foregroundColor(Color.theme.Blue3)
                    Spacer()
                }
                    .frame(width: 400, height: 200)
                    .background(Color.theme.Blue1)
                    .font(.body)
                    .foregroundColor(Color.theme.Yellow1)
                    .cornerRadius(30)
                
                
                
                
                    VStack {
                        HStack {
                            Text("Offered by:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text("I didnt collect this info oops")
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                                
                        }
                        
                        HStack {
                            Text("Materials Needed:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text(ask.materialsNeeded)
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                        }
                        
                        HStack {
                            Text("Estimated Time:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text(String(ask.estimatedTime))
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                        }
                        
                        HStack {
                            Text("Location:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text(ask.locationPreferences)
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                        }
                    }
                Spacer()
                VStack {
                    Spacer()
                    Text("Comments")
                    TextField("Comment", text: $comment)
                    
                    Spacer()
                    Button("Post a comment") {
                        askViewModel.addCommentToAsk(ask: ask, newComment: comment)
                    }
                }
            }
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
