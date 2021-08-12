//
//  Navigator.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

protocol Navigator: AnyObject
{
    associatedtype Destination: Navigatable
    associatedtype Controller: UIViewController
    
    var viewController: Controller? { get }
    
    func dismiss()
    func navigate(to destination: Destination)
    func present(_ controller: Destination)
}

extension Navigator
{
    func dismiss()
    {
        viewController?.dismiss()
    }
    
    func navigate(to destination: Destination)
    {
        viewController?.push(navigatable: destination)
    }
    
    func present(_ controller: Destination)
    {
        viewController?.present(navigatable: controller)
    }
    
    func setRoot(_ controller: Destination)
    {
        
    }
}

extension Navigator where Controller == UINavigationController
{
    func navigate(to destination: Destination)
    {
        guard viewController?.navigationController != nil else {
            viewController?.pushViewController(destination.viewController, animated: true)
            return
        }
        
        viewController?.push(navigatable: destination)
    }
}
