//
//  CollectionViewDataSource.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias ConfigurableCollectionViewCell = UICollectionViewCell & Configurable

typealias CountriesCollectionViewDataSource = CollectionViewDataSource<CountryViewModel, CountryCollectionViewCell>

class CollectionViewDataSource<Model, Cell: ConfigurableCollectionViewCell>:
    NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
where Cell.Model == Model
{
    // MARK:- Properties
    
    private(set) var items: [Model]
    weak var delegate: DataSourceDelegate?
    
    var isEmpty: Bool { items.isEmpty }
    var isNotEmpty: Bool { !isEmpty }
    
    var hSpaceBetweenTwoCells: CGFloat = 20.0
    var vSpaceBetweenTwoCells: CGFloat = 15.0
    var sectionEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    var cellSize: CGSize = CGSize(width: 160, height: 240)
    
    // MARK:- init
    
    init(_ items: [Model])
    {
        self.items = items
    }
    
    // MARK:- Methods
    
    func item(at indexPath: IndexPath) -> Model
    {
        items[indexPath.row]
    }
    
    // MARK:- UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let item = item(at: indexPath)
        let cell: Cell = collectionView.dequeue(for: indexPath)
        cell.configure(item, at: indexPath)
        return cell
    }
    
    // MARK:- UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        // animation
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let item = item(at: indexPath)
        delegate?.didSelect(item, at: indexPath)
    }
    
    // MARK:- UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return vSpaceBetweenTwoCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return hSpaceBetweenTwoCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionEdgeInsets
    }
}
