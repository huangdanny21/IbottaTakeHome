//
//  RootCoordinator.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class RootCoordinator: Coordinate {

    private lazy var offersViewController: UIViewController = {
        let coordinator = OffersCoordinator()
        let offersVC = OffersViewController()
        coordinator.viewController = offersVC
        let viewModel = OffersViewModel()
        viewModel.coordinator = coordinator
        offersVC.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: offersVC)
        return navigationController
    }()
    
    weak var viewController: UIViewController?
    weak var window: UIWindow? {
        didSet {
            viewController = window?.rootViewController
        }
    }

    func showScreen(_ screen: Screen) {
        switch screen {
        case .offerList:
            window?.rootViewController = offersViewController
        case .offerDetail:
            break
        }
    }
}

// MARK: - Define Screens
extension RootCoordinator {
    enum Screen {
        case offerList
        case offerDetail
    }
}
