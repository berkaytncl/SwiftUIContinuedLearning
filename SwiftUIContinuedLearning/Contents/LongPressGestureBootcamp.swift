//
//  LongPressGestureBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 18.10.2023.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        // start of press -> min duration
                        guard isPressing else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete.toggle()
                                    }
                                }
                            }
                            return
                        }
                        guard !isSuccess else { return }
                        withAnimation(.easeInOut(duration: 1)) {
                            isComplete.toggle()
                        }
                    }
                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
//        Text(isComplete ? "Completed" : "Not Complete")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? .green : .gray)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .onTapGesture {
//                isComplete.toggle()
//            }
//            .onLongPressGesture(minimumDuration: 5, maximumDistance: 50) {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
