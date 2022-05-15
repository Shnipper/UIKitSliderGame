//
//  ContentView.swift
//  UIKitSliderGame
//
//  Created by Евгений Волошенко on 15.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = Float.random(in: 0...100)
    @State private var hiddenValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Передвинь слайдер, как можно ближе к: \(hiddenValue)")
                .frame(width: 300)
            
            HStack {
                Text("0")
                CustomSlider(sliderValue: $sliderValue, alpha: computeScore())
                Text("100")
            }
            
            Button("Проверь Меня!") {
                showAlert = true
            }
            .alert("Your score", isPresented: $showAlert, actions: {}) {
                Text(String(computeScore()))
            }
            
            Button("Начать заново") {
                    hiddenValue = Int.random(in: 0...100)
                    sliderValue = Float.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(hiddenValue - Int(round(sliderValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
