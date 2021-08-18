//
//  OfferDetailViewModel.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import Foundation

final class OfferDetailViewModel: ViewModel {
    private let offer: OfferElement
    var coordinator: OfferDetailCoordinator?
    
    init(withOffer offer: OfferElement, coordinator: OfferDetailCoordinator) {
        self.offer = offer
        self.coordinator = coordinator
    }
}
