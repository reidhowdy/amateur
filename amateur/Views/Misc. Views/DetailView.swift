import SwiftUI

struct DetailView: View {
    var body: some View {
        
        
        VStack {
            Text("Title")
                .frame(width: 400, height: 100)
                .background(Color.theme.Blue1)
                .font(.largeTitle)
                .foregroundColor(Color.theme.Yellow1)
                .cornerRadius(30)
            VStack {
                Spacer()
                Text("Description. Here's the description la la la here is the information about the thing this post is aboutttttt.")
                Spacer()
                Text("Date Posted: Date Hereeeeeeeeeeee")
                Spacer()
            }
                .frame(width: 400, height: 200)
                .background(Color.theme.Blue1)
                .font(.body)
                .foregroundColor(Color.theme.Yellow1)
                .cornerRadius(30)
            
            AsyncImage(
                url: URL(string:"https://static01.nyt.com/images/2020/12/13/dining/ek-lofthouse/merlin_180932583_7cf08465-f282-4d4c-a1c7-4a770fd10a72-articleLarge.jpg"),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 100, maxHeight: 100)
                         .cornerRadius(100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Location:")
                            .frame(width: 150, height: 25, alignment: .leading)
                            .background(.white)
                        Text("Here it is")
                            .frame(width: 225, height: 25)
                            .background(Color.theme.Blue1)
                    }
                    
                    HStack {
                        Text("Materials Needed")
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
                    
                    HStack {
                        Text("Location:")
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
                    
                    HStack {
                        Text("Location:")
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
                .frame(width: 400, height: 400)
                .background(Color.theme.Yellow1)
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
