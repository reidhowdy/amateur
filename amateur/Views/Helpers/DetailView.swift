import SwiftUI

struct DetailView: View {
    var body: some View {
        
        
        ScrollView {
            VStack {
                Text("Title")
                    .frame(width: 400, height: 100)
                    .background(Color.theme.Blue1)
                    .font(.largeTitle)
                    .foregroundColor(Color.theme.Yellow1)
                    .cornerRadius(30)
                
                AsyncImage(
                    url: URL(string:"https://static01.nyt.com/images/2020/12/13/dining/ek-lofthouse/merlin_180932583_7cf08465-f282-4d4c-a1c7-4a770fd10a72-articleLarge.jpg"),
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
                    Text("Description. Here's the description la la la here is the information about the thing this post is aboutttttt.")
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
                            Text("Here it is")
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                                
                        }
                        
                        HStack {
                            Text("Materials Needed:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text("Here it is")
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                        }
                        
                        HStack {
                            Text("Estimated Time:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text("Here it is")
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                        }
                        
                        HStack {
                            Text("Location:")
                                .frame(width: 150, height: 25, alignment: .leading)
                                .background(.white)
                            Text("Here it is")
                                .frame(width: 225, height: 25)
                                .background(Color.theme.Blue1)
                        }
                    }
                Spacer()
                VStack {
                    Spacer()
                    Text("Comments")
                    Text("Comment1")
                    Text("Comment2")
                    
                    Spacer()
                    Button("Post a comment") {
                        print("Posted a comment")
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

//make test data that I wanna pass in, so that in the live view everything looks correctly
