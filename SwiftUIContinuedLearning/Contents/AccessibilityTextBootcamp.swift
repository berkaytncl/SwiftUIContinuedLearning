//
//  AccessibilityTextBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 28.10.2023.
//

import SwiftUI

// Dynamic Text

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            List(0 ..< 10) { _ in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "heart.fill")
//                            .font(.system(size: 20))
                        Text("Welcome to my app")
                            .truncationMode(.tail)
                    }
                    .font(.title)
                    
                    Text("This is some longer text that expands to multiple lines.")
                        .font(.subheadline)
//                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(3)
                        .minimumScaleFactor(dynamicTypeSize.customMinScaleFactor)
                }
//                .frame(height: 100)
                .background(.red)
//                .truncationMode(.head)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello, world!")
        }
    }
}

extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
