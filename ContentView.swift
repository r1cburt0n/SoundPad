//
//  ContentView.swift
//  SoundPad
//
//  Created by r1cburton on 7/11/24.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct ContentView: View {
    @State private var title: String = "SoundPad"
    @State private var audioPlayer: AVAudioPlayer?
    @State private var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    var body: some View {
        let tracks = [
            "Boris Brejcha at Grand Palais in Paris, France for Cercle.mp3",
            "Lane 8 Summer 2024 Mixtape.mp3",
            "Guy J - Live from Cave Romane (Croatia).mp3",
            "track4.mp3",
            "track5.mp3",
            "track6.mp3",
            "track7.mp3",
            "track8.mp3",
            "track9.mp3",
            "track10.mp3",
            "track11.mp3",
            "track12.mp3",
            "track13.mp3",
            "track14.mp3",
            "track15.mp3", "track16.mp3", "track17.mp3", "track18.mp3",
            "track19.mp3", "track20.mp3", "track21.mp3", "track22.mp3", "track23.mp3", "track24.mp3",
            "track25.mp3", "track26.mp3", "track27.mp3", "track28.mp3", "track29.mp3", "track30.mp3",
            "track31.mp3", "track32.mp3", "track33.mp3", "track34.mp3", "track35.mp3", "track36.mp3"
        ]
        
        let colors: [Color] = [
            Color(red: 153/255, green: 15/255, blue: 250/255), // #990FFA
            Color(red: 232/255, green: 185/255, blue: 11/255), // #E8B90B
            Color(red: 79/255, green: 236/255, blue: 104/255), // #4FEC68
            Color(red: 2/255, green: 243/255, blue: 236/255), // #02F3EC
            Color(red: 255/255, green: 87/255, blue: 34/255), // #FF5722
            Color(red: 255/255, green: 193/255, blue: 7/255), // #FFC107
            Color(red: 76/255, green: 175/255, blue: 80/255), // #4CAF50
            Color(red: 0/255, green: 188/255, blue: 212/255), // #00BCD4
            Color(red: 63/255, green: 81/255, blue: 181/255), // #3F51B5
            Color(red: 156/255, green: 39/255, blue: 176/255), // #9C27B0
            Color(red: 233/255, green: 30/255, blue: 99/255), // #E91E63
            Color(red: 255/255, green: 235/255, blue: 59/255), // #FFEB3B
            Color(red: 0/255, green: 150/255, blue: 136/255), // #009688
            Color(red: 255/255, green: 152/255, blue: 0/255), // #FF9800
            Color(red: 121/255, green: 85/255, blue: 72/255), // #795548
            Color(red: 158/255, green: 158/255, blue: 158/255), // #9E9E9E
            Color(red: 96/255, green: 125/255, blue: 139/255), // #607D8B
            Color(red: 244/255, green: 67/255, blue: 54/255), // #F44336
            Color(red: 139/255, green: 195/255, blue: 74/255), // #8BC34A
            Color(red: 103/255, green: 58/255, blue: 183/255), // #673AB7
            Color(red: 255/255, green: 64/255, blue: 129/255), // #FF4081
            Color(red: 255/255, green: 87/255, blue: 34/255), // #FF5722
            Color(red: 255/255, green: 193/255, blue: 7/255), // #FFC107
            Color(red: 76/255, green: 175/255, blue: 80/255), // #4CAF50
            Color(red: 0/255, green: 188/255, blue: 212/255), // #00BCD4
            Color(red: 63/255, green: 81/255, blue: 181/255), // #3F51B5
            Color(red: 156/255, green: 39/255, blue: 176/255), // #9C27B0
            Color(red: 233/255, green: 30/255, blue: 99/255), // #E91E63
            Color(red: 255/255, green: 235/255, blue: 59/255), // #FFEB3B
            Color(red: 0/255, green: 150/255, blue: 136/255), // #009688
            Color(red: 255/255, green: 152/255, blue: 0/255), // #FF9800
            Color(red: 121/255, green: 85/255, blue: 72/255), // #795548
            Color(red: 158/255, green: 158/255, blue: 158/255), // #9E9E9E
            Color(red: 96/255, green: 125/255, blue: 139/255), // #607D8B,
            Color(red: 255/255, green: 105/255, blue: 180/255), // #FF69B4
            Color(red: 75/255, green: 0/255, blue: 130/255) // #4B0082
        ]
        
        let gridItems = Array(repeating: GridItem(.flexible()), count: 6)
        
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(0..<36) { index in
                    Button(action: {
                        playSound(track: tracks[index])
                        title = "Playing: \(tracks[index])"
                    }) {
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(colors[index % colors.count])
                            .cornerRadius(8)
                    }
                }
            }
            
            HStack {
                Button(action: {
                    // Action for the first button
                }) {
                    Text("⏪")
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Action for the second button
                }) {
                    Text("⏯️")
                        .frame(width: 100, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Action for the third button
                }) {
                    Text("⏩")
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
    
    func playSound(track: String) {
        if let path = Bundle.main.path(forResource: track, ofType: nil) {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error loading track: \(error.localizedDescription)")
            }
        } else {
            print("Track not found: \(track)")
        }
    }
}

#Preview {
    ContentView()
}
