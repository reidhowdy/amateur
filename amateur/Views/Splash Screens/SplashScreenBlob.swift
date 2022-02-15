//
//  SplashScreenBlob.swift
//  amateur
//
//  Created by Grace on 2/12/22.
//

import SwiftUI

struct SplashScreenBlob: View {
    var body: some View {
        LottieView()
                .frame(width: 100, height: 100, alignment: .center)
    }
}

struct SplashScreenBlob_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenBlob()
    }
}
