//
//  OfferDetailCoordinator.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import Foundation

final class OfferDetailCoordinator: Coordinate {
    var viewController: OfferDetailViewController?
    
    func showScreen(_ screen: RootCoordinator.Screen) {
        switch screen {
        case .offerList:
            // Using Navigation's pop instead
            break
        default:
            break
        }
    }
}
