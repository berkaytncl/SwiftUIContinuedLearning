//
//  SoundsBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 19.10.2023.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance: SoundManager = SoundManager()
    private init() {}
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    private var player: AVAudioPlayer?
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player = nil
    }
}

struct SoundsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
            Button("Stop Sound") {
                SoundManager.instance.stopSound()
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
