//
//  OfferCollectionViewCell.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OfferCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "OfferCollectionViewCell"
    
    private var grayContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private var offerImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private var amountLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.demiBoldlFont
        label.textColor = UIColor.general
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.regularFont
        label.textColor = UIColor.general
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
        
    
    // MARK: Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(grayContainerView)
        grayContainerView.addSubview(offerImageView)
        contentView.addSubview(amountLabel)
        contentView.addSubview(nameLabel)
        let constraints = [grayContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                           grayContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                           grayContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                           grayContainerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                           grayContainerView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0/2.0),
                           offerImageView.leadingAnchor.constraint(equalTo: grayContainerView.leadingAnchor, constant: 6),
                           offerImageView.trailingAnchor.constraint(equalTo: grayContainerView.trailingAnchor, constant: -6),
                           offerImageView.topAnchor.constraint(equalTo: grayContainerView.topAnchor, constant: 6),
                           offerImageView.bottomAnchor.constraint(equalTo: grayContainerView.bottomAnchor, constant: -6),
                           amountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                           amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                           amountLabel.topAnchor.constraint(equalTo: offerImageView.bottomAnchor, constant: 8),
                           nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                           nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                           nameLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 3),
                           nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        contentView.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        offerImageView.image = nil
        nameLabel.text = nil
        amountLabel.text = nil
    }
}

extension OfferCollectionViewCell {
    func populate(withOffer offer: OfferElement) {
        if let imageUrl = offer.url {
            offerImageView.downloaded(from: imageUrl)
            contentView.layoutIfNeeded()
        }
        amountLabel.text = offer.offerDescription
        nameLabel.text = offer.name
    }
}
