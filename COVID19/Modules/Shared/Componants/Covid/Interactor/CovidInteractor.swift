//
//  CovidInteractor.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class CovidInteractor: CovidInteractorDelegate
{
    // MARK:- Properties
    
    var presenter: CovidPresenterDelegate?
    
    private let networkManager: CovidNetworkable
    private var countriesData: [String: CountryData] = [:] // [CountryCode: CountryData]
    
    // MARK:- init
    
    required init(_ networkManager: CovidNetworkable = CovidNetworkManager())
    {
        self.networkManager = networkManager
    }
    
    // MARK:- Methods
    
    func getLatestCountryData(by code: String)
    {
        if let _ = countriesData[code]
        {
            presentCountryData(by: code)
        }
        else
        {
            loadLatestCountryData(by: code)
        }
    }
    
    func getDailyReport(in date: String)
    {
        networkManager.getDailyReportTotals(in: date)
        { [weak self] result in
            guard let self = self else { return }
            
            switch result
            {
                case let .success(response):
                    self.presentCovid(dailyReport: response)
                    
                case let .failure(error):
                    self.presenter?.didRecive(error: .unkown(error.localizedDescription))
            }
        }
    }
    
    // MARK:- Helper
    
    private func loadLatestCountryData(by code: String)
    {
        networkManager.getLatestCountryData(by: code)
        { [weak self] result in
            guard let self = self else { return }
            
            switch result
            {
                case let .success(response):
                    self.saveNewCountryData(response, code: code)
                    self.presentCountryData(by: code)
                    
                case let .failure(error):
                    self.presenter?.didRecive(error: .unkown(error.localizedDescription))
            }
        }
    }
    
    private func saveNewCountryData(_ response: CountryDataResponse, code: String)
    {
        guard !response.isEmpty,
              let countryData = response["0"]
        else { return }
        
        countriesData[code] = countryData
    }
    
    private func presentCountryData(by code: String)
    {
        guard let data = countriesData[code] else { return }
        
        presenter?.didRecive(country: data)
    }
    
    private func presentCovid(dailyReport response: CovidReportResponse)
    {
        guard !response.isEmpty,
              let report = response["0"]
        else { return }
        
        presenter?.didRecive(daily: report)
    }
}
