//
//  OffersCoordinator.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OffersCoordinator: Coordinate {
    var viewController: OffersViewController?
    
    private lazy var offerDetailViewController: UIViewController = {
        let coordinator = OfferDetailCoordinator()
        let vc = OfferDetailViewController()
        coordinator.viewController = vc
        let viewModel = OfferDetailViewModel()
        viewModel.coordinator = coordinator
        vc.viewModel = viewModel
        return vc
    }()
    
    func showScreen(_ screen: RootCoordinator.Screen) {
        switch screen {
        case .offerDetail:
            break
        default:
            break
        }
    }
}
