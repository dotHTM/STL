import Foundation
import KituraContracts

func initializeCodableRoutes(app: App) {
    // Register routes here
    app.router.post("/codable", handler: app.postHandler)
    app.router.get("/codable", handler: app.getAllHandler)
}

extension App {
    static var codableStore = [Book]()
    // Write handlers here
    func postHandler(book: Book, completion: (Book?, RequestError?) -> Void) {
        App.codableStore.append(book)
        completion(book, nil)
    }

    func getAllHandler(completion: ([Book]?, RequestError?) -> Void) {
        completion(App.codableStore, nil)
    }
}
