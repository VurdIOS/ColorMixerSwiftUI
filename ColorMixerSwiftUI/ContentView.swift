//
//  ContentView.swift
//  ColorMixerSwiftUI
//
//  Created by Камаль Атавалиев on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 100.0
    @State private var greenSliderValue = 100.0
    @State private var blueSliderValue = 100.0
    
    @State private var redTFValue = ""
    @State private var greenTFValue = ""
    @State private var blueTFValue = ""
    
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                ColorMixerView(
                    redValue: $redSliderValue,
                    greenValue: $greenSliderValue,
                    blueValue: $blueSliderValue
                )
                
                VStack {
                    ColorSliderView(
                        value: $redSliderValue,
                        tintColor: Color(.red)
                    )
                    ColorSliderView(
                        value: $greenSliderValue,
                        tintColor: Color(.green)
                    )
                    ColorSliderView(
                        value: $blueSliderValue,
                        tintColor: Color(.blue)
                    )
                }
                Spacer()
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

struct ColorSliderView: View {
    @Binding var value: Double
    
    @State var tintColor: Color
    
    @State private var  tfValue = ""
    @State private var tfTitle = ""

    
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1).tint(tintColor)
            TextField(tfTitle, text: $tfValue) {
                value = Double(tfValue) ?? value
                tfTitle = ""
            }
            .frame(width: 50)
            .textFieldStyle(.roundedBorder)
        }
    }
}

struct ColorMixerView: View {
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 150)
            .foregroundColor(
                Color(
                    red: redValue/255,
                    green: greenValue/255,
                    blue: blueValue/255
                )
            )
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
    }
}
