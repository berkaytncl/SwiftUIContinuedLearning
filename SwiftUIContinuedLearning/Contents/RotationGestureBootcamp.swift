//
//  RotationGestureBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 18.10.2023.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State private var angle = Angle(degrees: 0.0)
    
    var body: some View {
        Rectangle()
             .frame(width: 200, height: 200, alignment: .center)
             .rotationEffect(angle)
             .gesture(rotation)
             .animation(.spring, value: angle)
    }
}

#Preview {
    RotationGestureBootcamp()
}

extension RotationGestureBootcamp {
    private var rotation: some Gesture {
        RotateGesture()
            .onChanged { value in
                angle = value.rotation
            }
    }
}
