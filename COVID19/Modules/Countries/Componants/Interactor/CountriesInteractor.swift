//
//  CountriesInteractor.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class CountriesInteractor: CountriesInteractorDelegate
{
    // MARK:- Properties
    
    var presenter: CountriesPresenterDelegate?
    
    private let networkManager: CountriesNetworkable
    
    // MARK:- init
    
    required init(_ networkManager: CountriesNetworkable = CountriesNetworkManager())
    {
        self.networkManager = networkManager
    }
    
    // MARK:- Methods
    
    func search(for key: String)
    {
        guard key.isNotEmptyOrSpaces else {
            presenter?.didRecive(countries: [])
            return
        }
        
        searchRequest(for: key)
    }
    
    // MARK:- Helper
    
    private func searchRequest(for key: String)
    {
        networkManager.search(by: key)
        { [weak self] result in
            guard let self = self else { return }
            
            switch result
            {
                case let .success(response):
                    self.presenter?.didRecive(countries: response)
                    
                case let .failure(error):
                    self.presenter?.didRecive(error: .unkown(error.localizedDescription))
            }
        }
    }
}
