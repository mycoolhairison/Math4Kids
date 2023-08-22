//
//  CountingDotsView.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct CountingDotsView: View {
    var st : Set<Int>
    var body: some View {
        GeometryReader { gr in
            let width = gr.size.width / CGFloat(10)
            let height = gr.size.height / CGFloat(10)
            
            let colors = [Color.red,Color.white]
            HStack(spacing:5) {
                VStack(spacing:5) {
                    ForEach(0..<8) { i in
                        HStack(spacing:5) {
                            Group {
                                ForEach(0..<8) { j in
                                    Circle()
                                        .fill(colors[st.contains(i*8+j) ? 0 : 1])
                                        .frame(width: width, height: height)
                                }
                            }
                        }
                    }
                }
            }
        }
        .frame(width: 250, height: 220)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
    }
}

struct CountingDotsView_Previews: PreviewProvider {
    static var previews: some View {
        CountingDotsView(st : [1,20,53])
    }
}
