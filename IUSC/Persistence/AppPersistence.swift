import Foundation
import SwiftData

struct AppPersistence {
    
    let dataContainer: ModelContainer
    
    init() {
        let schema = Schema([
            Item.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            self.init(
                dataContainer: try ModelContainer(for: schema, configurations: [modelConfiguration])
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    init(dataContainer: ModelContainer) {
        self.dataContainer = dataContainer
    }
}
