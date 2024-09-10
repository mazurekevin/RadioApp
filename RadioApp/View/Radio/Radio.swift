//
//  Radio.swift
//  RadioApp
//
//  Created by teamdoc on 05/09/2024.
//

import Foundation
import SwiftUI
import AVKit
import SwiftyJSON

struct RadioView: View {
    var radio: RadioStation
    
    @State private var isPlaying = false
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: radio.icon)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .cornerRadius(12)
                        .padding()
                } else {
                    Color.gray
                        .frame(height: 300)
                        .cornerRadius(12)
                        .padding()
                }
            }
            
            Text(radio.name)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            
            /*Text("eyh.dev")
                .font(.subheadline)
                .foregroundColor(.secondary)*/
            
            Spacer()
            
            // Contrôles de lecture
            VStack {
                
                HStack {
                    Button(action: {
                       
                    }) {
                        Image(systemName: "backward.fill")
                            .font(.largeTitle)
                    }
                    
                    Button(action: {
                        isPlaying.toggle()
                        if isPlaying {
                            playStream()
                        } else {
                            pauseStream()
                        }
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                    }
                    .padding(.horizontal, 20)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "forward.fill")
                            .font(.largeTitle)
                    }
                }
                .padding(.top, 20)
            }
            .padding(.bottom, 50)
        }
        .navigationTitle(radio.name)
        .padding()
        .onAppear {
            setupPlayer()
        }
    }
 
    func setupPlayer() {
        if let url = URL(string: radio.streamUrls.first?.value ?? "") {
            player = AVPlayer(url: url)
        }
    }
    
    func playStream() {
        player?.play()
    }
    
    func pauseStream() {
        player?.pause()
    }

}


