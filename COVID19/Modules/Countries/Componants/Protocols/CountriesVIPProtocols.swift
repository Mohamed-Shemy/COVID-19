//
//  CountriesVIPProtocols.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

// MARK: VIP Protocols

// MARK: View

protocol CountriesViewDelegate: AnyObject
{
    var interactor: CountriesInteractorDelegate? { get set }
    var router: HomeRouter? { get set }
    
    func display(countries dataSource: CountriesCollectionViewDataSource)
    func display(error message: AlertMessage)
}

// MARK: Interactor

protocol CountriesInteractorDelegate: AnyObject
{
    var presenter: CountriesPresenterDelegate? { get set }
    
    init(_ networkManager: CountriesNetworkable)
    func search(for key: String)
}

// MARK: Presenter

protocol CountriesPresenterDelegate: AnyObject
{
    var view: CountriesViewDelegate? { get set }
    
    func didRecive(countries searchResult: [Country])
    func didRecive(error message: AlertMessage)
}
