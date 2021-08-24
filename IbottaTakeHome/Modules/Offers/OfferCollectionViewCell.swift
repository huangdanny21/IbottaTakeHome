//
//  OfferCollectionViewCell.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OfferCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "OfferCollectionViewCell"
    
    private lazy var grayContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var offerImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font(type: .demiBold(12.0)).instance
        label.textColor = UIColor.general
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font(type: .regular(11.0)).instance
        label.textColor = UIColor.general
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var favoritedButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkmark"), for: .normal)
        button.backgroundColor = .white
        return button
    }()

    // MARK: Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(grayContainerView)
        grayContainerView.addSubview(offerImageView)
        contentView.addSubview(amountLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(favoritedButton)
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
                           nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                           favoritedButton.widthAnchor.constraint(equalToConstant: 25.0),
                           favoritedButton.heightAnchor.constraint(equalToConstant: 25.0),
                           favoritedButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                           favoritedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
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
        amountLabel.text = offer.currentValue
        nameLabel.text = offer.name
        if let id = offer.id {
            favoritedButton.isHidden = !UserDefaults.standard.bool(forKey: id)
        }
    }
}
