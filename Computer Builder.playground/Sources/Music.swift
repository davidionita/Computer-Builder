import AVFoundation

public class Music {
    var music: AVAudioPlayer?
    public static var musicSingleton = Music()
    
    public init() { }
    
    public func play() {
        let path = Bundle.main.path(forResource: "Music.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            music = try AVAudioPlayer(contentsOf: url)
            music?.volume = 0.3
            music?.prepareToPlay()
            music?.play()
        } catch {
            
        }
    }

}
