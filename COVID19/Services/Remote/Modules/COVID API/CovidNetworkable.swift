//
//  CovidNetworable.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol CovidNetworkable: AnyObject
{
    func getLatestCountryData(by code: String, completion: @escaping (Result<CountryDataResponse, Error>) -> Void)
    func getDailyReportTotals(in date: String, completion: @escaping (Result<CovidReportResponse, Error>) -> Void)
}
