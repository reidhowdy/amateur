//
//  OfferDetailView.swift
//  amateur
//
//  Created by Grace on 1/27/22.
//

import SwiftUI

struct OfferDetailView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Offer Details")
                .font(.largeTitle)
            HStack {
                
                Text("Title: Here Is The Title Of My Thing")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .bottom])
                Spacer()
                Text("Description: Here is the description of my thing")
                    .font(.body)
                    .multilineTextAlignment(.trailing)
                    .padding(.all)
                
            }
            Spacer()
            Text("Date Posted: Jan 27 2022")
            Text("Est time to complete: 2.5 hours")
                .multilineTextAlignment(.leading)
            Text("Number of Est. Sessions: 3")
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView()
    }
}
