import PlaygroundSupport
import UIKit

let startPage = StartViewController()

// Note: I wanted to make the view wider so I could have the images of the build be larger, but for some reason, my MacBook Pro maxed out the width at this.
startPage.preferredContentSize = CGSize(width: 734, height: 840)

Narration.narrationSingleton.narrate(string: "Welcome to Computer Builder ! ")

Music.musicSingleton.play()

PlaygroundPage.current.liveView = startPage
