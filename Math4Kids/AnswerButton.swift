//
//  AnswerButton.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct AnswerButton: View {
    var ans : String
    var body: some View {
        Text("\(ans)")
            .frame(width:110,height:110)
            .font(.system(size: 40, weight:.bold))
            .foregroundColor(Color.white)
            .background(Color.blue)
            .clipShape(Circle())
            .padding()
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(ans: "100")
    }
}
