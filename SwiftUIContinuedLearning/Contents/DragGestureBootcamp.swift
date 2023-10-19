//
//  DragGestureBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 18.10.2023.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State private var isDragging = false
    @State private var offset: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            
            ZStack {
                VStack {
                    Text("\(offset.width)")
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 500)
                    .offset(offset)
                    .scaleEffect(1 - abs(offset.width / screenWidth) / 1.5)
                    .rotationEffect(Angle(degrees: 30 * offset.width / screenWidth))
                    .gesture(drag)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    DragGestureBootcamp()
}

extension DragGestureBootcamp {
    private var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.spring) {
                    offset = value.translation
                }
            }
            .onEnded { _ in
                withAnimation(.spring) {
                    offset = .zero
                }
            }
    }
}
