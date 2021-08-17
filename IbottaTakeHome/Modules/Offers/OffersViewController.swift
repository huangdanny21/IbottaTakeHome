//
//  OffersViewController.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

class OffersViewController: UIViewController, View {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
         let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
         layout.scrollDirection = .horizontal
         collection.translatesAutoresizingMaskIntoConstraints = false
         collection.backgroundColor = .clear
         return collection
    }()
    
    var viewModel: OffersViewModel!
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offers"
        view.backgroundColor = .white
    }
}

extension OffersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension OffersViewController: UICollectionViewDelegate {
    
}
