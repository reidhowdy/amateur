import SwiftUI

struct DetailView: View {
    var body: some View {
        
        
        GeometryReader { geometry in
        ScrollView {
            VStack {
                Text("Title")
                    .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.1)
                    .font(.largeTitle)
                    .cornerRadius(30)
                    .background(Color.white)
                    .foregroundColor(Color.black)

                
                AsyncImage(
                    url: URL(string:"https://static01.nyt.com/images/2020/12/13/dining/ek-lofthouse/merlin_180932583_7cf08465-f282-4d4c-a1c7-4a770fd10a72-articleLarge.jpg"),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(height: geometry.size.height * 0.5)
//                             .frame(width: geometry.size.width * 0.90)
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
                
                
                Text("Description. Here's the description la la la here is the information about the thing this post is aboutttttt.")
                    .font(.body)
                    .frame(height: geometry.size.height * 0.15, alignment: .leading)
                    .font(.body)
                
                
                    VStack {
                        HStack {
                            Text("Posted on:")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                            Text("Here it is")
                                .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                        }
                        
                        
                        HStack {
                            Text("Offered by:")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                            Text("Here it is")
                                .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Materials:")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                            Text("Here it is")
                                .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Estimated Time:")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                            Text("Here it is")
                                .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Location:")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.05, alignment: .leading)
                            Text("Here it is")
                                .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.05, alignment: .trailing)
                        }
                    }
                Spacer()
                VStack {
                    Spacer()
                    Text("Comments")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    Text("Comment1")
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.05, alignment: .leading)
                        .border(Color.black)
                        
                    Text("Comment2")
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.05, alignment: .leading)
                        .border(Color.black)
                    
                    Spacer()
                    Button("Post a comment") {
                        print("Posted a comment")
                    }
                    .padding()
                    .cornerRadius(25)
                    .background(Color.theme.Green4)
                    .foregroundColor(Color.white)
                    
                }
                .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.30)
            
            }
            .toolbar{

                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.075)
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
