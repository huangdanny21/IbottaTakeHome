//
//  Coordinate.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

protocol Coordinate {
    associatedtype Screen
    associatedtype View: UIViewController

    var viewController: View? { get set } // TRY TO SUBCLASS THIS WITH WEAK, SO you don't run into retain cycle

    func showScreen(_ screen: Screen)
    func showError(_ error: Error)
}

// MARK: - Coordinator
extension Coordinate {
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(ok)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
