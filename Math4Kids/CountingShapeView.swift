//
//  CountingShapeView.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct CountingShapeView: View {
    var cc : [Int]
    var ci : Int
    var gs : Int
    @ViewBuilder var body: some View {
        let shapes = ["circle.fill","triangle.fill","square.fill","circle.fill","diamond.fill"]
        let colors = [Color(.white),Color(.systemPurple),Color(.systemPurple), Color(.systemPurple),Color(.systemPurple)]
        let shapeNames = ["circles","triangles","squares","circles","diamonds"]
        
        Group {
            Text("Count the \(shapeNames[ci]) ")+Text(Image(systemName: shapes[ci]))
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
                                Image(systemName: shapes[cc[i*gs+j]])
                                    .foregroundColor(colors[cc[i*gs+j]])
                                    .font(.system(size: height))
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

struct CountingShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CountingShapeView(cc: [Int](repeating: 2, count: 100), ci:1, gs: 8)
    }
}
