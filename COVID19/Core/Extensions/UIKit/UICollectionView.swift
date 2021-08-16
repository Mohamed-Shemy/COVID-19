//
//  UICollectionView.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UICollectionView
{
    func register<Cell: UICollectionViewCell>(nib cell: Cell.Type)
    {
        register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func register<Cell: UICollectionViewCell>(class cell: Cell.Type)
    {
        register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell
    {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? Cell
        else { fatalError("Cannot dequeue cell with identifier '\(id)'") }
        return cell
    }
}
