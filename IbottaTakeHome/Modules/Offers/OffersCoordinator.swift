//
//  OffersCoordinator.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OffersCoordinator: Coordinate {
    var viewController: OffersViewController?
    
    private func offerDetailViewController(withOffer offer: OfferElement) -> UIViewController {
        let coordinator = OfferDetailCoordinator()
        let vc = OfferDetailViewController()
        coordinator.viewController = vc
        let viewModel = OfferDetailViewModel(withOffer: offer, coordinator: coordinator)
        vc.viewModel = viewModel
        return vc
    }
    
    func showScreen(_ screen: RootCoordinator.Screen) {
        switch screen {
        case .offerDetail(let element):
            viewController?.navigationController?.pushViewController(offerDetailViewController(withOffer: element), animated: true)
        default:
            break
        }
    }
}
