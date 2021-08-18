//
//  OfferDetailViewModel.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import Foundation

final class OfferDetailViewModel: ViewModel {
    var coordinator: OfferDetailCoordinator?
    
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
