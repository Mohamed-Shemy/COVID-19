//
//  CovidVIPProtocols.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

// MARK: VIP Protocols

// MARK: View

protocol CovidViewDelegate: AnyObject
{
    var interactor: CovidInteractorDelegate? { get set }
    var router: HomeRouter? { get set }
    
    func display(country data: CountryDataViewModel, _ dataSource: ReportValuesTableViewDataSource)
    func display(daily report: CovidReportViewModel, _ dataSource: ReportValuesTableViewDataSource)
    func display(error message: AlertMessage)
}

extension CovidViewDelegate
{
    var router: HomeRouter? { nil }
    func display(country data: CountryDataViewModel, _ dataSource: ReportValuesTableViewDataSource) { }
    func display(daily report: CovidReportViewModel, _ dataSource: ReportValuesTableViewDataSource) { }
}

// MARK: Interactor

protocol CovidInteractorDelegate: AnyObject
{
    var presenter: CovidPresenterDelegate? { get set }
    
    init(_ networkManager: CovidNetworkable)
    func getLatestCountryData(by code: String)
    func getDailyReport(in date: String)
}

// MARK: Presenter

protocol CovidPresenterDelegate: AnyObject
{
    var view: CovidViewDelegate? { get set }
    
    func didRecive(country data: CountryData)
    func didRecive(daily report: CovidReport)
    func didRecive(error message: AlertMessage)
}
