//
//  MissingAlphaView.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct LetterCompleteView: View {
    var ca: Int
    var body: some View {
        let answerLocation = Int.random(in: max(0,ca-23)...min(2,ca))
        if answerLocation==0 {
            Text("_  " + String(UnicodeScalar(ca+97-answerLocation+1)!) + "  " + String(UnicodeScalar(ca+97-answerLocation+2)!))
                .font(.system(size: 100))
                .bold()
        }
        else if answerLocation==1 {
            Text(String(UnicodeScalar(ca+97-answerLocation)!) + "  _  " + String(UnicodeScalar(ca+97-answerLocation+2)!))
                .font(.system(size: 100))
                .bold()
        }
        else {
            Text(String(UnicodeScalar(ca+97-answerLocation)!) + "  " + String(UnicodeScalar(ca+97-answerLocation+1)!) + "  _")
                .font(.system(size: 100))
                .bold()
        }
    }
}

struct LetterCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        LetterCompleteView(ca: 10)
    }
}
