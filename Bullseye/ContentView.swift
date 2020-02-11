//
//  ContentView.swift
//  Bullseye
//
//  Created by Drew Terry on 2/11/20.
//  Copyright © 2020 Drew Terry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // @State means if variable changes the body will be refreshed
    @State var alertIsVisible = false
    @State var sliderValue = 50.0 // Double means decimal point value
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 0
    
    var body: some View {

        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }
            Spacer()
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            Button(action: {
                print("Button Pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) {() -> Alert in
                return Alert(title: Text("\(alertTitle())"),
                    message: Text("The slider's value is \(roundedValue()).\n" +
                            "You scored \(self.pointsForCurrentRound()) points this round!"
                    ), dismissButton: .default(Text("Awesome")) {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.round = self.round + 1
                        self.target = Int.random(in: 1...100)
                    })
            }
            Spacer()
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round")
                Text("\(round)")
                Spacer()
                Button(action: {
                }) {
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
    }
    
    func roundedValue() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = abs(roundedValue() - target)
        var bonus = 0
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        }
        return maxScore - difference + bonus
    }
    
    
    func resetGame() {
        target = Int.random(in: 1...100)
        score = 0
        sliderValue = 50
        round = 0
    }
    
    func alertTitle() -> String {
        let points = pointsForCurrentRound()
        let title: String
        if points == 100 {
            title = "Perfect"
        } else if points >= 95 {
            title = "Close!"
        } else if points >= 90 {
            title = "Meh..."
        } else {
            title = "Not even close..."
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}
