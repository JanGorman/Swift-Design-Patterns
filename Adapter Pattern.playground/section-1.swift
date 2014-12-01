// Playground - noun: a place where people can play

import UIKit

protocol MusicPlayer {

    func insertMedia(title: String)
    func play()

}

class CassettePlayer: MusicPlayer {

    func insertMedia(title: String) {
        println("Insert mixtape \(title)")
    }

    func play() {
        println("Push down clunky button and play")
    }

}

protocol MediaPlayer {

    func getMedia(title: String)
    func play()

}

class StreamingMediaPlayer: MediaPlayer {

    func getMedia(title: String) {
        println("Acquiring \(title) from the cloud")
    }

    func play() {
        println("Playing!")
    }

}

class StreamingMediaPlayerAdapter: MusicPlayer {

    let player: StreamingMediaPlayer

    init(player: StreamingMediaPlayer) {
        self.player = player
    }

    func insertMedia(title: String) {
        player.getMedia(title)
    }

    func play() {
        player.play()
    }

}