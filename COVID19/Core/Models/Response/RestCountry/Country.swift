//
//  Country.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Country: Codable
{
    let name: String?
    let alpha2Code: String?
    let flag: String?
    
    var viewModel: CountryViewModel?
    {
        guard let name = name, let code = alpha2Code else {
            return nil
        }
        
        return CountryViewModel(name: name, code: code, flag: flag ?? "")
    }
}

struct CountryViewModel
{
    let name: String
    let code: String
    let flag: String
}
