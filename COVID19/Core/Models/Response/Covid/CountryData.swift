//
//  CountryData.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct CountryData: Codable
{
    let country: String?
    let code: String?
    let confirmed: Int?
    let recovered: Int?
    let critical: Int?
    let deaths: Int?
    let latitude: Double?
    let longitude: Double?
    let lastChange: String?
    let lastUpdate: String?
    
    var viewModel: CountryDataViewModel?
    {
        guard let country = country,
              let code = code
        else { return nil }
        
        return CountryDataViewModel(country: country, code: code,
                                    confirmed: confirmed ?? 0, recovered: recovered ?? 0,
                                    critical: critical ?? 0, deaths: deaths ?? 0,
                                    latitude: latitude ?? 0, longitude: longitude ?? 0,
                                    lastChange: lastChange ?? "", lastUpdate: lastUpdate ?? "")
    }
}

struct CountryDataViewModel
{
    let country: String
    let code: String
    let confirmed: Int
    let recovered: Int
    let critical: Int
    let deaths: Int
    let latitude: Double
    let longitude: Double
    let lastChange: String
    let lastUpdate: String
}

extension CountryDataViewModel
{
    var covidReport: CovidReportViewModel
    {
        let active = max(confirmed - (recovered + deaths + critical), 0)
        return .init(confirmed: confirmed, recovered: recovered, deaths: deaths, active: active, critical: critical, date: lastUpdate)
    }
}
