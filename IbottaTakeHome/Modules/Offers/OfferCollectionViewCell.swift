//
//  OfferCollectionViewCell.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OfferCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "OfferCollectionViewCell"
    
    private var offerImageView: UIImageView? = {
        return nil
    }()
    
    private var amountLabel: UILabel? = {
        return nil
    }()
    
    private var nameLabel: UILabel? = {
        return nil
    }()
}

extension OfferCollectionViewCell {
    func populate(withOffer offer: OfferElement) {
        amountLabel?.text = offer.offerDescription
        nameLabel?.text = offer.name
    }
}
