//
//  CovidPresenter.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class CovidPresenter: CovidPresenterDelegate
{
    // MARK:- Properties
    
    weak var view: CovidViewDelegate?
    
    private var reportValuesDataSource: ReportValuesTableViewDataSource!
    
    // MARK:- Methods
    
    func didRecive(country data: CountryData)
    {
        guard let dataViewModel = data.viewModel else { return }
        
        reportValuesDataSource = createReportValuesDataSource(from: dataViewModel.covidReport)
        view?.display(country: dataViewModel, reportValuesDataSource)
    }
    
    func didRecive(daily report: CovidReport)
    {
        guard let reportViewModel = report.viewModel else { return }
        
        reportValuesDataSource = createReportValuesDataSource(from: reportViewModel)
        view?.display(daily: reportViewModel, reportValuesDataSource)
    }
    
    func didRecive(error message: AlertMessage)
    {
        view?.display(error: message)
    }
    
    // MARK:- Helper
    
    private func createReportValuesDataSource(from report: CovidReportViewModel) -> ReportValuesTableViewDataSource
    {
        let titles = ["Confirmed", "Recovered", "Deaths", "Active", "Critical"]
        let values = [report.confirmed, report.recovered, report.deaths, report.active, report.critical]
        let progress = values.map { Float($0) / Float(report.confirmed) }
        let reportValues: [ReportValue] = zip(titles, zip(values, progress))
            .map({ title, stat in ReportValue(title: title, value: stat.0, progress: stat.1) })
        return ReportValuesTableViewDataSource(reportValues)
    }
}
