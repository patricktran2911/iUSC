import AVFoundation

public final class SpeechService {
    private let synthesizer = AVSpeechSynthesizer()

    public init() {}
    public func speak(_ text: String, languageCode: String = "en-US") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: languageCode)
        utterance.rate = 0.5 // adjust speaking speed
        synthesizer.speak(utterance)
    }

    public func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
