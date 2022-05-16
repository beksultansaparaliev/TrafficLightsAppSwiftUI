//
//  ContentView.swift
//  TrafficLightsAppSwiftUI
//
//  Created by Masaie on 12/5/22.
//

import SwiftUI

private enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    
    @State private var redLightState = 0.3
    @State private var yellowLightState = 0.3
    @State private var greenLightState = 0.3
    
    @State private var currentLight: CurrentLight = .red
    
    private func nextColor() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLight {
        case .red:
            greenLightState = lightIsOff
            redLightState = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLightState = lightIsOff
            yellowLightState = lightIsOn
            currentLight = .green
        case .green:
            yellowLightState = lightIsOff
            greenLightState = lightIsOn
            currentLight = .red
        }
    }
        
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorCircleView(color: .red, opacity: redLightState)
                ColorCircleView(color: .yellow, opacity: yellowLightState)
                ColorCircleView(color: .green, opacity: greenLightState)
                
                Spacer()
                
                ChangeColorButton(title: buttonTitle) {
                    if buttonTitle ==  "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColor()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
