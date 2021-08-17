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
    
    // MARK: - Computed
    
    // MARK: - Public
    
    func fetchOffers(withCompletion completion: @escaping (Result<Offers, Error>) -> Void) {
        guard let data = jsonLoader.readLocalFile(forName: "Offers") else {
            completion(.failure(App.ServiceError.noJson))
            return
        }
        do {
            let offers = try Offers.init(data: data)
            completion(.success(offers))
        }
        catch let error {
            completion(.failure(error))
        }
    }
}
