//
//  OfferDetailViewModel.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import Foundation

final class OfferDetailViewModel: ViewModel {
    let offer: OfferElement
    var coordinator: OfferDetailCoordinator?
    
    // MARK: - Computed
    
    lazy var title: String = {
        return offer.name ?? offer.offerDescription ?? ""
    }()
    
    var isFavorited: Bool {
        if let id = offer.id {
            return UserDefaults.standard.bool(forKey: id)
        }
        return false
    }
    
    // MARK: - Constructor
    
    init(withOffer offer: OfferElement, coordinator: OfferDetailCoordinator) {
        self.offer = offer
        self.coordinator = coordinator
    }
    
    func bookmarkTapped(withCommpletion completion: ((Bool) -> Void)) {
        guard let id = offer.id else {
            completion(false)
            return
        }
        
        if UserDefaults.standard.bool(forKey: id) {
            UserDefaults.standard.setValue(false, forKey: id)
            completion(false)
        } else {
            UserDefaults.standard.setValue(true, forKey: id)
            completion(true)
        }
    }
}
