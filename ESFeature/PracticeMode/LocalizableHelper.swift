public extension String {
    static func localizable(_ text: String) -> Self {
        String(localized: .init(text), bundle: .module)
    }
}
