import SwiftUI

struct OfferDetail: View {
    var offer: Offer
    
    @ObservedObject var offerViewModel: OfferViewModel
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
    @State private var comment: String = ""
    
    @State private var isSaved: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
        ScrollView {
            VStack(alignment: .center) {
                Text(offer.title)
                    .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.1)
                    .font(.largeTitle)
                    .cornerRadius(30)
                    .background(Color.white)
                    .foregroundColor(Color.black)
        
                HStack {
                    Spacer()
                    AsyncImage(
                        url: URL(string:offer.photo),
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
                    Spacer()
                }
                
                Text(offer.description)
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
                        Text(offer.materialsNeeded)
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Estimated Time:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text("\(offer.estimatedTime)")
                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Location:")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                        Text(offer.locationPreferences)
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
                    ForEach(offer.comments, id: \.self) { comment in
                        Text(comment)
                            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.05, alignment: .leading)
        
                    }
        
                    TextField("Comment", text: $comment)
                    Button("Post") {
                        offerViewModel.addCommentToOffer(offer: offer, newComment: comment)
                        offerViewModel.getOffers()
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
                        offerViewModel.removeSavedToOffer(offer: offer, currentUserId: userAuthInfo.user?.uid ?? "")
                        isSaved = false
                    } else {
                        offerViewModel.addSavedToOffer(offer: offer, currentUserId: userAuthInfo.user?.uid ?? "")
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
            isSaved = offer.saved.contains(userAuthInfo.user?.uid ?? "")
        }
    }
}
