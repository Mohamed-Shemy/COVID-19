//
//  CountriesPresenter.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class CountriesPresenter:CountriesPresenterDelegate
{
    // MARK:- Properties
    
    weak var view: CountriesViewDelegate?
    
    private var countriesDataSource: CountriesCollectionViewDataSource!
    
    //MARK:- Methods
    
    func didRecive(countries searchResult: [Country])
    {
        let viewModels = searchResult.compactMap(\.viewModel)
            .sorted(by: \.name, <)
        countriesDataSource = .init(viewModels)
        view?.display(countries: countriesDataSource)
    }
    
    func didRecive(error message: AlertMessage)
    {
        view?.display(error: message)
    }
}
