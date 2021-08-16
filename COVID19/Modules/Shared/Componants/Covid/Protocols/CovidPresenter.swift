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
    
    func didRecive(country data: CountryData)
    {
        guard let dataViewModel = data.viewModel else { return }
        
        view?.display(country: dataViewModel)
    }
    
    func didRecive(daily report: CovidReport)
    {
        guard let reportViewModel = report.viewModel else { return }
        
        view?.display(daily: reportViewModel)
    }
    
    func didRecive(error message: AlertMessage)
    {
        view?.display(error: message)
    }
}
