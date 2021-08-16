//
//  RootNavigator.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias RootRouter = Router<RootNavigator, UINavigationController>

enum RootNavigator: Navigatable
{
    case home
    
    var viewController: UIViewController
    {
        HomeViewController()
    }
}
