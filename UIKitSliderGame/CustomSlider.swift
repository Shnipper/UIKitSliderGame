//
//  SliderView.swift
//  UIKitSliderGame
//
//  Created by Евгений Волошенко on 15.05.2022.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor.systemRed.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = sliderValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(sliderValue: .constant(50), alpha: 20)
    }
}
