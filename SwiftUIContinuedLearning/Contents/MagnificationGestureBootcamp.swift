//
//  MagnificationGestureBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 18.10.2023.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @GestureState private var magnifyBy = 1.0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(magnifyBy)
                .gesture(magnification)
                .animation(.spring, value: magnifyBy)
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

#Preview {
    MagnificationGestureBootcamp()
}

extension MagnificationGestureBootcamp {
    private var magnification: some Gesture {
        MagnifyGesture()
            .updating($magnifyBy) { value, gestureState, transaction in
                gestureState = value.magnification
            }
    }
}
