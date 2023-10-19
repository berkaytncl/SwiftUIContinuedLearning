//
//  ScrollViewReaderBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 19.10.2023.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @Namespace var topID
    @Namespace var bottomID
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Go to #\(textFieldText)") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
            }
            
            ScrollViewReader { proxy in
                ScrollView {
                    Button("Scroll to Bottom") {
                        withAnimation(.spring) {
                            proxy.scrollTo(bottomID)
                        }
                    }
                    .id(topID)
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                    }
                    
                    Button("Top") {
                        withAnimation(.spring) {
                            proxy.scrollTo(topID, anchor: .bottom)
                        }
                    }
                    .id(bottomID)
                }
                .onChange(of: scrollToIndex) { oldValue, newValue in
                    withAnimation(.spring) {
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
