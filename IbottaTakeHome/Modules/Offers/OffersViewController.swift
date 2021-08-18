//
//  OffersViewController.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OffersViewController: UIViewController, View {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: OfferCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = .clear
        return collection
    }()
    
    var viewModel: OffersViewModel!
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offers"
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
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
    }
    
    private func createOfferLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(144.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 24
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension OffersViewController: UICollectionViewDataSource {
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
