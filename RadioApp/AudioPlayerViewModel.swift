import Foundation
import AVFoundation
import SwiftUI

class AudioPlayerViewModel: ObservableObject {
    var player: AVAudioPlayer?
    
    func loadAudio(from url: URL) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            do {
                let data = try Data(contentsOf: url)
                self?.player = try AVAudioPlayer(data: data)
                self?.player?.prepareToPlay()
            } catch let error {
                print("Error loading audio: \(error.localizedDescription)")
            }
        }
    }
    
    func play() {
        player?.play()
    }
    
    func stop() {
        player?.stop()
    }
}
