//
//  OffersViewModel.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import Foundation

final class OffersViewModel: ViewModel {
    var coordinator: OffersCoordinator?
    private let jsonLoader = JSONLoader()
    
    var offers: Offers?
    
    // MARK: - Computed
    
    var numOfItems: Int {
        return offers?.count ?? 0
    }
    
    // MARK: - Public
    
    func fetchOffers(withCompletion completion: @escaping (Result<Offers, Error>) -> Void) {
        guard let data = jsonLoader.readLocalFile(forName: "Offers") else {
            completion(.failure(App.ServiceError.noJson))
            return
        }
        do {
            let offers = try Offers.init(data: data)
            self.offers = offers
            completion(.success(offers))
        }
        catch let error {
            completion(.failure(error))
        }
    }
}
