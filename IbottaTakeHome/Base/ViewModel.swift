//
//  ViewModel.swift
//  IbottaTakeHome
//
//  Created by Danny Huang on 8/17/21.
//

import Foundation

protocol ViewModel {
    associatedtype CoordinatorType: Coordinate
    var coordinator: CoordinatorType? { get set }
}
