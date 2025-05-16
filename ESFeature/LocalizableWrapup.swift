public extension String {
    public static func localizable(_ text: String) -> Self {
        String(localized: .init(text), bundle: .module)
    }
}
