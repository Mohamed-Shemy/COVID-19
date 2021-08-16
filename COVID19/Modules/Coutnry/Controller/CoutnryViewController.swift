//
//  CoutnryViewController.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController
{
    // MARK:- Outles
    
    @IBOutlet weak var statisticsTableView: UITableView!
    @IBOutlet weak var flagImageView: UIImageView!
    
    // MARK:- Properties
    
    var interactor: CovidInteractorDelegate?
    var router: HomeRouter?
    
    private let country: CountryViewModel
    
    // MARK:- init
    
    init(_ country: CountryViewModel)
    {
        self.country = country
        super.init(nibName: Self.identifier, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder)
    {
        fatalError("use init(:_)")
    }
    
    // MARK:- LifeCycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        getCountryData()
    }
    
    // MARK:- Setup
    
    private func setup()
    {
        setupComponants()
        setupTableView()
        addSearchButton()
        setupCountry()
    }
    
    private func setupComponants()
    {
        let interactor = CovidInteractor()
        let presenter = CovidPresenter()
        let router = HomeRouter(self)
        
        interactor.presenter = presenter
        presenter.view = self
        self.interactor = interactor
        self.router = router
    }
    
    private func setupTableView()
    {
        statisticsTableView.register(nib: ReportTableViewCell.self)
        statisticsTableView.tableFooterView = UIView()
    }
    
    private func addSearchButton()
    {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self, action: #selector(dismissAction(_:)))
    }
    
    private func setupCountry()
    {
        title = country.name
        flagImageView.setImage(from: country.flag)
    }
    
    // MARK:- Methods
    
    private func getCountryData()
    {
        interactor?.getLatestCountryData(by: country.code)
    }
    
    private func set(report dataSource: ReportValuesTableViewDataSource)
    {
        statisticsTableView.dataSource = dataSource
        statisticsTableView.reloadData()
    }
}

// MARK:- CovidViewDelegate

extension CountryViewController: CovidViewDelegate
{
    func display(country data: CountryDataViewModel, _ dataSource: ReportValuesTableViewDataSource)
    {
        set(report: dataSource)
    }
    
    func display(error message: AlertMessage)
    {
        showAlert(.app, message)
    }
}
