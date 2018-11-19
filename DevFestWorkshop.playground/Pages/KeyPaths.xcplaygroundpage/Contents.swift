// Keypaths
// https://www.hackingwithswift.com/articles/57/how-swift-keypaths-let-us-write-more-natural-code

protocol Identifiable {
  
  associatedtype ID
  
  static var idKey: WritableKeyPath<Self, ID> { get }
}

struct Person: Identifiable {
  static let idKey = \Person.socialSecurityNumber
  
  var socialSecurityNumber: String
  var name: String
  var age: Int
}

struct Book: Identifiable {
  
  static let idKey = \Book.isbn
  
  var isbn: String
  var title: String
}


func printID<T: Identifiable>(_ thing: T) {
  print(thing[keyPath: T.idKey])
}

let kristaps = Person(socialSecurityNumber: "123", name: "Kristaps", age: 100)
printID(kristaps)


