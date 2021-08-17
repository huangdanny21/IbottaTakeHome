//
//  Application.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class Application {
    static let current = Application()
    var coodinator: RootCoordinator?

    private init() {}

    func root(in window: UIWindow?) {
        let coodinator = RootCoordinator()
        coodinator.window = window
        coodinator.showScreen(.offerList)
    }
}
