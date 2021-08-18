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
        let imageView = UIImageView(frame: .zero)
        return imageView
    }()
    
    private var amountLabel: UILabel? = {
        let label = UILabel()
        label.font = App.Font.demiBoldlFont
        label.textColor = UIColor.general

        return label
    }()
    
    private var nameLabel: UILabel? = {
        let label = UILabel()
        label.font = App.Font.regularFont
        label.textColor = UIColor.general
        return label
    }()
}

extension OfferCollectionViewCell {
    func populate(withOffer offer: OfferElement) {
        if let imageUrl = offer.url {
            offerImageView?.downloaded(from: imageUrl)
        }
        amountLabel?.text = offer.offerDescription
        nameLabel?.text = offer.name
    }
}
