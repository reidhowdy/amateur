import SwiftUI

struct OfferDetail: View {
    var offer: Offer
    
    @ObservedObject var offerViewModel: OfferViewModel
    @EnvironmentObject var userAuthInfo : LoginViewModel
    
    @State private var comment: String = ""
    
    @State private var isSaved: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text(offer.title)
                    .frame(width: 400, height: 100)
                    .background(Color.theme.Blue1)
                    .font(.largeTitle)
                    .foregroundColor(Color.theme.Yellow1)
                    .cornerRadius(30)
                
                AsyncImage(
                    url: URL(string:offer.photo),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 300, maxHeight: 300)
                             .cornerRadius(25)
                             .padding()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                VStack {
                    Spacer()
                    Text(offer.description)
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
                        Text(offer.materialsNeeded)
                            .frame(width: 225, height: 25)
                            .background(Color.theme.Blue1)
                    }
                    
                    HStack {
                        Text("Estimated Time:")
                            .frame(width: 150, height: 25, alignment: .leading)
                            .background(.white)
                        Text(String(offer.estimatedTime))
                            .frame(width: 225, height: 25)
                            .background(Color.theme.Blue1)
                    }
                    
                    HStack {
                        Text("Location:")
                            .frame(width: 150, height: 25, alignment: .leading)
                            .background(.white)
                        Text(offer.locationPreferences)
                            .frame(width: 225, height: 25)
                            .background(Color.theme.Blue1)
                    }
                }
                Spacer()
                VStack {
                    Spacer()
                    Text("Comments")
//                    Form {
                    
//                    }
                    
                    Spacer()
                    
                    //this will act weird if a comment is duplicated
                    ForEach(offer.comments, id: \.self) { comment in
                        Text(comment)
                            .padding()
//                            .alignment(.leading)
                    }
                    
                    TextField("Comment", text: $comment)
                    Button("Post") {
                        offerViewModel.addCommentToOffer(offer: offer, newComment: comment)
                        offerViewModel.getOffers()
                    }
                        .frame(width: 50, height: 25)
                        .cornerRadius(25)
                        .foregroundColor(Color.theme.Brown1)
                        .background(Color.theme.Brown3)
                
                    
                }
                .frame(width: 400, height: 200)
            }
        }
        .toolbar {
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
        .onAppear {
            isSaved = offer.saved.contains(userAuthInfo.user?.uid ?? "")
            //sets the button on appear by using the instance of offer that was passed in!
            //so easily tells us if this has been saved by the user or not
        }
    }
}

//struct OfferDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            OfferDetail(offer: offerTestData[0])
//        }
//    }
//}

//struct Previews_OfferDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferDetail(offer: offer)
//    }
//}
