//
//  OfferDetailViewController.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import UIKit

final class OfferDetailViewController: UIViewController, View {
    var viewModel: OfferDetailViewModel!
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offers"
        view.backgroundColor = .white
    }
}
