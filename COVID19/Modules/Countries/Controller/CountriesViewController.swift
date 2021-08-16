//
//  CountriesViewController.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noResultLabel: UILabel!
    
    // MARK:- Properties
    
    var interactor: CountriesInteractorDelegate?
    var router: HomeRouter?
    
    private var searchController: UISearchController!
    
    // MARK:- LifeCycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
    }
    
    // MARK:- Setup
    
    private func setup()
    {
        setupComponants()
        setupCollectionView()
        setupSearchController()
        setTitle()
    }
    
    private func setupComponants()
    {
        let interactor = CountriesInteractor()
        let presenter = CountriesPresenter()
        let router = HomeRouter(self)
        
        interactor.presenter = presenter
        presenter.view = self
        self.interactor = interactor
        self.router = router
    }
    
    private func setupCollectionView()
    {
        collectionView.register(nib: CountryCollectionViewCell.self)
    }
    
    private func setupSearchController()
    {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search ..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.becomeFirstResponder()
        searchController.becomeFirstResponder()
    }
    
    private func setTitle()
    {
        title = "Search"
    }
    
    // MARK:- Methods
    
    private func set(countries dataSource: CountriesCollectionViewDataSource)
    {
        dataSource.cellSize = .init(width: 160, height: 42)
        dataSource.delegate = self
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
    }
    
    // MARK:- Actions
    
    @objc func search(_ searchBar: UISearchBar)
    {
        guard let searchKey = searchBar.text else { return }
        
        interactor?.search(for: searchKey)
    }
}

// MARK:- UISearchResultsUpdating

extension CountriesViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        NSObject.cancelPreviousPerformRequests(withTarget: self,
                                               selector: #selector(search(_:)),
                                               object: searchController.searchBar)
        
        perform(#selector(search(_:)), with: searchController.searchBar, afterDelay: 0.5)
    }
}

// MARK:- CountriesViewDelegate

extension CountriesViewController: CountriesViewDelegate
{
    func display(countries dataSource: CountriesCollectionViewDataSource)
    {
        set(countries: dataSource)
        
        noResultLabel.isHidden = true
    }
    
    func display(error message: AlertMessage)
    {
        noResultLabel.isHidden = false
        noResultLabel.text = message.value
    }
}

// MARK:- DataSourceDelegate

extension CountriesViewController: DataSourceDelegate
{
    func didSelect(_ item: Any, at indexPath: IndexPath)
    {
        guard let country = item as? CountryViewModel else { return }
        
        router?.navigate(to: .country(country))
    }
}
