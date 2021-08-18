//
//  OfferDetailView.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OfferDetailView: UIView {
    static func makeOfferDetailView(withOffer offer: OfferElement) -> OfferDetailView {
        let view = OfferDetailView()
        if let url = offer.url {
            view.offerImageView.downloaded(from: url)
        }
        view.amountLabel.text = offer.currentValue
        view.desciptionLabel.text = offer.offerDescription
        return view
    }
    
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
        label.font = App.Font(type: .demiBold(24.0)).instance
        label.textColor = .general
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var desciptionLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font(type: .regular(22.0)).instance
        label.textColor = .general
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Constructors
    
    init() {
        super.init(frame: .zero)
        setupScrollView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UI
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(offerImageView)
        scrollViewContainer.addArrangedSubview(amountLabel)
        scrollViewContainer.addArrangedSubview(desciptionLabel)
        
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func setUpConstraints() {
        let imageViewConstraints = [offerImageView.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
                                    offerImageView.heightAnchor.constraint(equalTo: scrollViewContainer.widthAnchor, multiplier: 1.0/2.0)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
    }
}

