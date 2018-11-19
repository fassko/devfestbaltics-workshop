import UIKit

// Coordinators
// https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps

protocol Coordinator {
  var childCoordinators: [Coordinator] { get set }
  
  var navigationController: UINavigationController { get set }
}

class MainCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = ViewController.instatiate()
    navigationController.pushViewController(vc, animated: true)
  }
}


// Storyboarded
protocol Storyboarded {
  static func instatiate() -> Self
}

extension Storyboarded where Self: UIViewController {
  static func instatiate() -> Self {
    let id = String(describing: self)
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: id) as! Self
  }
}

// Match names in Storyboard

class ViewController: UIViewController, Storyboarded {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

