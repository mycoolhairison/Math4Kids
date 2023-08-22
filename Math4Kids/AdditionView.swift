//
//  AdditionView.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct AdditionView: View {
    var fn : Int
    var sn : Int
    var body: some View {
        HStack {
            VStack(spacing:0) {
                Text("\(fn)")
                    .font(.system(size: 100))
                    .bold()
                GeometryReader { gr in
                    let width = gr.size.width / CGFloat(4)
                    let height = gr.size.height / CGFloat(3)
                    
                    let colors = [Color.red,Color.white]
                    HStack(spacing:50) {
                        VStack(spacing:8) {
                            ForEach(0..<3) { i in
                                HStack(spacing:8) {
                                    Group {
                                        ForEach(0..<3) { j in
                                            Circle()
                                                .fill(colors[i*3+j+1>fn ? 1 : 0])
                                                .frame(width: width, height: height)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: 100, height: 100)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
            }
            VStack(spacing:0) {
                Text("+")
                    .font(.system(size: 100))
                    .bold()
                GeometryReader { gr in
                    
                }
                .frame(width: 50, height: 100)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
            VStack(spacing:0) {
                Text("\(sn)")
                    .font(.system(size: 100))
                    .bold()
                GeometryReader { gr in
                    let width = gr.size.width / CGFloat(4)
                    let height = gr.size.height / CGFloat(3)
                    
                    //let r = firstNumber/3
                    //let c = firstNumber % 3
                    
                    let colors = [Color.red,Color.white]
                    HStack(spacing:50) {
                        VStack(spacing:8) {
                            ForEach(0..<3) { i in
                                HStack(spacing:8) {
                                    Group {
                                        ForEach(0..<3) { j in
                                            Circle()
                                                .fill(colors[i*3+j+1>sn ? 1 : 0])
                                                .frame(width: width, height: height)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: 100, height: 100)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
        }
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView(fn: 4, sn: 6)
    }
}
