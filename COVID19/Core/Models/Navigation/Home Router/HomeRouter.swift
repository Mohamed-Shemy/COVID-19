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
    case country(Country)
    
    var viewController: UIViewController
    {
        #warning("Not implemented yet")
        switch self
        {
            case .search: return UIViewController()
            case let .country(country): return UIViewController()
        }
    }
}
