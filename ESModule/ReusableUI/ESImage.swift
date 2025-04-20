import SwiftUI

public extension Image {
    
    enum ESResizable {
        
        public static func symbols(
            _ symbols: String.ESSymbols,
            capInsets: EdgeInsets = EdgeInsets(),
            resizingMode: Image.ResizingMode = .stretch
        ) -> Image {
            
            Image(systemName: symbols.name)
                .resizable(capInsets: capInsets, resizingMode: resizingMode)
        }
    }
}
