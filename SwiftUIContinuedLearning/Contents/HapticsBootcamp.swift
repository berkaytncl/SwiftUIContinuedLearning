//
//  HapticsBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 20.10.2023.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Notification success") { HapticManager.instance.notification(type: .success) }
            Button("Notification error") { HapticManager.instance.notification(type: .error) }
            Button("Notification warning") { HapticManager.instance.notification(type: .warning) }
            Divider()
            Button("Impact soft") { HapticManager.instance.impact(style: .soft) }
            Button("Impact light") { HapticManager.instance.impact(style: .light) }
            Button("Impact medium") { HapticManager.instance.impact(style: .medium) }
            Button("Impact rigid") { HapticManager.instance.impact(style: .rigid) }
            Button("Impact heavy") { HapticManager.instance.impact(style: .heavy) }
        }
    }
}

#Preview {
    HapticsBootcamp()
}
