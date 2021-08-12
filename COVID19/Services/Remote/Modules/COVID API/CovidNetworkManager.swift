//
//  CovidNetworkManager.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class CovidNetworkManager: CovidNetworkable
{
    // MARK:- Properties
    
    private let moyaService: MoyaService<CovidAPI>
    
    // MARK:- Init
    
    init(type: ServiceType = .live)
    {
        moyaService = MoyaService(type: type)
    }
    
    // MARK:- Method
    
    func getLatestCountryData(by code: String, completion: @escaping (Result<CountryDataResponse, Error>) -> Void)
    {
        moyaService.request(targetCase: .latestCountryDataByCode(code), completion: completion)
    }
    
    func getDailyReportTotals(in date: String, completion: @escaping (Result<CovidReportResponse, Error>) -> Void)
    {
        moyaService.request(targetCase: .dailyReportTotals(date), completion: completion)
    }
}
