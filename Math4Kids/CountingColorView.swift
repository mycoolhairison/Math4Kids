//
//  CountingColorView.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct CountingColorView: View {
    var cc : [Int]
    var ci : Int
    var gs : Int
    @ViewBuilder var body: some View {
        let colors = [Color.white,Color.orange,Color.black,Color.purple,Color.mint]
        let colorNames = ["white","orange","black","purple","mint"]
        
        Group { Text("Count the ") + Text("\(colorNames[ci])").foregroundColor(colors[ci]) + Text(" dots")
            
        }
            .font(.system(size: 30))
            .bold()
        
        GeometryReader { gr in
            let width = gr.size.width / CGFloat(10)
            let height = gr.size.height / CGFloat(10)
            
            VStack(spacing:5) {
                ForEach(0..<gs, id: \.self) { i in
                    HStack(spacing:5) {
                        Group {
                            ForEach(0..<gs, id: \.self) { j in
                                Circle()
                                    .fill(colors[cc[i*gs+j]])
                                    .frame(width: width, height: height)
                            }
                        }
                    }
                }
            }
        }
        .frame(width: 250, height: 220)
        //.background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
    }
}

struct CountingColorView_Previews: PreviewProvider {
    static var previews: some View {
        CountingColorView(cc: [Int](repeating: 3, count: 100), ci:3, gs:8)
    }
}
