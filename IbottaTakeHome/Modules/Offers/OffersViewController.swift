//
//  OffersViewController.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OffersViewController: UIViewController, View {
    private let estimatedCellHeight: CGFloat = 150.0
    private let horizontalPadding: CGFloat = 8.0
    private let verticalPadding: CGFloat = 24.0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: OfferCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = .clear
        return collection
    }()
    
    var viewModel: OffersViewModel!
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpCollectionView()
        viewModel.fetchOffers { result in
            switch result {
            case .success:
                print("Succcess")
                DispatchQueue.main.async { [weak self] in
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.viewModel.coordinator?.showError(error)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        collectionView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return UIDevice.current.hasNotch
    }
    
    // MARK: - UI
    
    private func setUpCollectionView() {
        view.addSubview(collectionView)
        let collectionViewConstraints = [collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
                                         collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                         collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
                                         collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
        NSLayoutConstraint.activate(collectionViewConstraints)
        collectionView.collectionViewLayout = createOfferLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func createOfferLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        var height = estimatedCellHeight
        if UIDevice.current.userInterfaceIdiom == .pad {
            height = estimatedCellHeight * 2 // jut for scaling
        }
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(horizontalPadding)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = verticalPadding
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension OffersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let offer = viewModel.offers?[indexPath.row] else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.reuseIdentifier, for: indexPath) as? OfferCollectionViewCell else { return OfferCollectionViewCell() }
        cell.populate(withOffer: offer)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let offer = viewModel.offers?[indexPath.row] else { return }
        viewModel.coordinator?.showScreen(.offerDetail(offer))
    }
}
