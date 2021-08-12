//
//  Router.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class Router<Destination: Navigatable, Controller: UIViewController>: Navigator
{
    weak var viewController: Controller?
   
    init(_ view: Controller?)
    {
        viewController = view
    }
}
