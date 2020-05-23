import AVFoundation

public class Narration {
    var narration: AVSpeechSynthesizer
    public static var narrationSingleton = Narration()
    
    public init() { narration = AVSpeechSynthesizer() }
    
    public func narrate(string: String) {
        let words = AVSpeechUtterance(string: string)
        narration.speak(words)
    }
    
    public func stop() { narration.stopSpeaking(at: AVSpeechBoundary.immediate) }
    
}

