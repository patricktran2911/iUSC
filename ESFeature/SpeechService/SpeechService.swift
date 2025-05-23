import AVFoundation

public final class SpeechService {
    public enum VoiceSpeed: Float {
        case slow = 0.45
        case medium = 0.5
        case fast = 0.58
    }
    
    private let synthesizer = AVSpeechSynthesizer()
    private var voiceSpeed: VoiceSpeed = .fast

    public init() {}
    
    public func speak(_ text: String, languageCode: String = "en-US") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: languageCode)
        utterance.rate = voiceSpeed.rawValue // adjust speaking speed
        synthesizer.speak(utterance)
    }
    
    public func updateVoiceSpeed(_ voiceSpeed: VoiceSpeed) {
        self.voiceSpeed = voiceSpeed
    }

    public func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
