//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Detroit Labs on 6/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }

                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                        Image(countries[number]).renderingMode(.original)
                    })
                }

                Spacer()
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(
                title: Text("Your score is ???"),
                dismissButton: .default(Text("Continue")) {
                    askQuestion()
                }
            )
        })
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
