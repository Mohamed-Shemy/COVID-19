//
//  CountriesNetworkable.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol CountriesNetworkable: AnyObject
{
    func search(by name: String, completion: @escaping (Result<CountriesResponse, Error>) -> Void)
}
