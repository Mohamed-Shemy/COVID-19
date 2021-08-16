//
//  HomeRouter.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias HomeRouter = Router<HomeNavigator, UIViewController>

enum HomeNavigator: Navigatable
{
    case search
    case country(CountryViewModel)
    
    var viewController: UIViewController
    {
        switch self
        {
            case .search: return CountriesViewController()
            case let .country(country): return CountryViewController(country)
        }
    }
}
