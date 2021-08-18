//
//  OfferDetailViewController.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OfferDetailViewController: UIViewController, View {
    var viewModel: OfferDetailViewModel!
    
    private lazy var favoriteBarButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "star"), style: .plain, target: self, action: #selector(saveActionTapped))
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = OfferDetailView.makeOfferDetailView(withOffer: viewModel.offer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.backgroundColor = .white
        addFavoriteButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return UIDevice.current.hasNotch
    }
    
    // MARK: - UI
    
    private func addFavoriteButton() {
        if viewModel.isFavorited {
            favoriteBarButton.image = UIImage(named: "checkmark")
        } else {
            favoriteBarButton.image = UIImage(named: "star")
        }
        navigationItem.rightBarButtonItem = favoriteBarButton
    }
    
    @objc private func saveActionTapped() {
        viewModel.bookmarkTapped { isSaved in
            if isSaved {
                favoriteBarButton.image = UIImage(named: "checkmark")
            } else {
                favoriteBarButton.image = UIImage(named: "star")
            }
        }
    }
}
