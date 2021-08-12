//
//  CountriesNetworkManager.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class CountriesNetworkManager: CountriesNetworkable
{
    // MARK:- Properties
    
    private let moyaService: MoyaService<CountriesAPI>
    
    // MARK:- Init
    
    init(type: ServiceType = .live)
    {
        moyaService = MoyaService(type: type)
    }
    
    // MARK:- Method
    
    func search(by name: String, completion: @escaping (Result<CountriesResponse, Error>) -> Void)
    {
        moyaService.request(targetCase: .searchByName(name), completion: completion)
    }
}
