//
//  Configurable.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol Configurable: AnyObject
{
    associatedtype Model
    func configure(_ item: Model, at indexPath: IndexPath)
}
