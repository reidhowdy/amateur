import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    func makeUIView(context: Context) -> some AnimationView {
        let lottieAnimationView = AnimationView(name:"liquid-blobby-loader-green")
        lottieAnimationView.play()
        return lottieAnimationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
    
    
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct LottieView_Previews: PreviewProvider {
//    static var previews: some View {
//        LottieView()
//    }
//}
