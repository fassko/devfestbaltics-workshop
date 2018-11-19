// Protocols with associatedtype
// https://www.hackingwithswift.com/articles/74/understanding-protocol-associated-types-and-their-constraints

protocol Item {
  init(fileName: String)
}

struct Movie: Item {
  var fileName: String
}

struct Song: Item {
  var fileName: String
}

protocol Screen {
  associatedtype ItemType: Item = Movie
  associatedtype ChildScreen: Screen where ChildScreen.ItemType == ItemType
  
  var items: [ItemType] { get set }
  var childScreens: [ChildScreen] { get set }
}

class MainScreen<T: Item>: Screen {
  var items = [T]()
  var childScreens = [CategoryScreen<T>]()
}

class CategoryScreen<T: Item>: Screen {
  var items = [T]()
  var childScreens = [DetailScreen<T>]()
}

class DetailScreen<T: Item>: Screen {
  var items = [T]()
  var childScreens = [DetailScreen<T>]()
}
