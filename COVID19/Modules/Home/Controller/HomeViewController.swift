//
//  HomeViewController.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var noDataLabel: UILabel!
    
    // MARK:- Properties
    
    var interactor: CovidInteractorDelegate?
    var router: HomeRouter?
        
    // MARK:- LifeCycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        getDailyReport()
    }
    
    // MARK:- Setup
    
    private func setup()
    {
        setupComponants()
        setupTableView()
        addSearchButton()
        setTitle()
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
        tableView.register(nib: ReportTableViewCell.self)
        tableView.tableFooterView = UIView()
    }
    
    private func addSearchButton()
    {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self, action: #selector(searchButtonDidTapped))
    }
    
    private func setTitle()
    {
        title = "Home"
    }
    
    // MARK:- Methods
    
    private func getDailyReport()
    {
        #warning("For test only")
        // Current date returns an empty response
        let dateString = "2020-07-21" // Date().format("yyyy-MM-dd")
        interactor?.getDailyReport(in: dateString)
    }
    
    private func set(report dataSource: ReportValuesTableViewDataSource)
    {
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    private func setHeader(from report: CovidReportViewModel)
    {
        lastUpdateLabel.text = "Last Update \(report.date)"
    }
    
    // MARK:- Actions
    
    @objc func searchButtonDidTapped(_ sender: Any)
    {
        router?.navigate(to: .search)
    }
}

extension HomeViewController: CovidViewDelegate
{
    func display(daily report: CovidReportViewModel, _ dataSource: ReportValuesTableViewDataSource)
    {
        set(report: dataSource)
        setHeader(from: report)
    }
    
    func display(error message: AlertMessage)
    {
        noDataLabel.isHidden = false
        noDataLabel.text = message.value
    }
}
