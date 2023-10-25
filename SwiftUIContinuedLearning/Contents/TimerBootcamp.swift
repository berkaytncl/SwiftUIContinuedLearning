//
//  TimerBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 25.10.2023.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    //Current time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
     
     private func updateTimeRemaining() {
         let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
         let hour = remaining.hour ?? 0
         let minute = remaining.minute ?? 0
         let second = remaining.second ?? 0
         timeRemaining = "\(hour):\(minute):\(second)"
     }
    */
    
    // Animation counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .black]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.purple)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(.page)

//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundStyle(.white)
        }
        .onReceive(timer, perform: { _ in
            withAnimation() {
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
