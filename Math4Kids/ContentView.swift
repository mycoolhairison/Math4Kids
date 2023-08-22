//
//  ContentView.swift
//  Math4Kids
//
//  Created by Michael Harrison on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var charAnswer = false
    @State private var choiceArray : [Int] = [0,1,2,3]
    @State private var answerDisplay : [String] = ["a","b","c","d"]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 9
    @State private var score = 0
    @State private var countSet = Set<Int>()
    @State private var countMap = Dictionary<Int,Int>()
    @State private var problemType = 2
    @State private var colorIndex = 0
    @State private var gridSize = 8
    @State private var colorCounts = [Int](repeating: 0, count: 100)
    
    var body: some View {
        VStack(spacing:10) {
            problemView()
            HStack {
                ForEach(0..<2) { index in
                    Button {
                        answerIsCorrect(answer:choiceArray[index])
                        problemSelector()
                    } label: {
                        AnswerButton(ans: answerDisplay[index])
                    }
                }
            }
            
            HStack {
                ForEach(2..<4) { index in
                    Button {
                        answerIsCorrect(answer:choiceArray[index])
                        problemSelector()
                    } label: {
                        AnswerButton(ans: answerDisplay[index])
                    }
                }
            }
            Text("Score: \(score)")
                .font(.headline)
                .bold()
        }
        .onAppear(perform: problemSelector)
    }
    
    func answerIsCorrect(answer: Int) {
        if answer==correctAnswer {
            score+=1
            problemType = (problemType + 1) % 5
            //self.difficulty+=self.score
        }
        else {
            score=0
            problemType = (problemType + 1) % 5
            //self.difficulty=10
        }
    }
    
    func problemSelector() {
        if problemType==0 {
            additionProblem()
        }
        else if problemType==1 {
            countingProblem()
        }
        else if problemType==2 {
            countingColorProblem()
        }
        else if problemType==3 {
            countingColorProblem()
        }
        else if problemType==4 {
            missingAlphaProblem()
        }
        generateAnswers()
    }
    
    func additionProblem() {
        firstNumber = Int.random(in: 0...difficulty)
        secondNumber = Int.random(in: 0...difficulty)
        correctAnswer = firstNumber + secondNumber
    }
    
    func countingProblem() {
        countSet.removeAll()
        correctAnswer = Int.random(in: 1...16)
        while countSet.count < correctAnswer {
            countSet.insert(Int.random(in: 0...63))
        }
    }
    
    func missingAlphaProblem() {
        correctAnswer = Int.random(in: 0..<26)
        charAnswer = true
    }
    
    func countingColorProblem() {
        colorCounts = [Int](repeating: 0, count: (gridSize*gridSize))
        colorIndex = Int.random(in: 1...4)
        correctAnswer = Int.random(in: 1...(3*gridSize)/4)
        var uniques = 0
        while uniques < correctAnswer {
            let temp = Int.random(in: 0..<(gridSize*gridSize))
            if colorCounts[temp]==0 {
                uniques+=1
                colorCounts[temp]=colorIndex
            }
        }
        for i in 1...4 {
            if i != colorIndex {
                let additionals = Int.random(in: 1...(3*gridSize)/4)
                for _ in 1...additionals {
                    let temp = Int.random(in: 0..<(gridSize*gridSize))
                    if colorCounts[temp]==0 {
                        colorCounts[temp]=i
                    }
                }
            }
        }
    }
    
    func generateAnswers() {
        var s: Set = [correctAnswer]
        var minBound = min(correctAnswer/2,1)
        var maxBound = max(10,3*correctAnswer/2)
        if charAnswer {
            minBound = 0
            maxBound = 25
        }
        while s.count < 4 {
            s.insert(Int.random(in: minBound...maxBound))
        }
        choiceArray = Array(s).shuffled()
        if !charAnswer {
            for i in 0..<4 {
                answerDisplay[i]=String(choiceArray[i])
            }
        }
        else {
            for i in 0..<4 {
                answerDisplay[i]=String(UnicodeScalar(choiceArray[i]+97)!)
            }
            charAnswer=false
        }
        
    }
    
    func problemView() -> some View {
        Group {
            if problemType==0 {
                AdditionView(fn: firstNumber, sn: secondNumber)
            }
            else if problemType==1 {
                CountingDotsView(st: countSet)
            }
            else if problemType==2 {
                CountingColorView(cc: colorCounts, ci: colorIndex, gs: gridSize)
            }
            else if problemType==3 {
                CountingShapeView(cc: colorCounts, ci: colorIndex, gs: gridSize)
            }
            else if problemType==4 {
                LetterCompleteView(ca: correctAnswer)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
