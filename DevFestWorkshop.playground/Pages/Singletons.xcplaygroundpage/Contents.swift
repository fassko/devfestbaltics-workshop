// https://www.hackingwithswift.com/example-code/language/what-is-a-singleton
//


// Hiding singleton behing protocol
// https://www.hackingwithswift.com/articles/88/how-to-implement-singletons-in-swift-the-smart-way

class Logger {
  static var shared: Logger = Logger()
  
  private init() { }
  
  func log(_ message: String) {
    print(message)
  }
}

protocol Logging {
//  func log(_ message: String)
}

extension Logging {
  func log(_ message: String) {
    Logger.shared.log(message)
  }
}


struct MainScreen: Logging {
  
  func auth() {
    log("test")
  }
}

let screen = MainScreen()
screen.auth()
