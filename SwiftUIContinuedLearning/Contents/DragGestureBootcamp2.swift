//
//  DragGestureBootcamp2.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 19.10.2023.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY) //startingOffsetY + currentDragOffsetY + endingOffsetY
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(drag)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcamp2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the decription for our app. This is my favorite SwiftUI course and I recommend to all of my friends to subscribe to Swiftful Thinking!")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.clipShape(RoundedRectangle(cornerRadius: 10)))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

extension DragGestureBootcamp2 {
    private var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.spring) {
                    currentDragOffsetY = value.translation.height
                }
            }
            .onEnded { _ in
                withAnimation(.spring) {
                    if currentDragOffsetY < -150 {
                        endingOffsetY = -startingOffsetY
                    } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                        endingOffsetY = 0
                    }
                    currentDragOffsetY = 0
                }
            }
    }
}
