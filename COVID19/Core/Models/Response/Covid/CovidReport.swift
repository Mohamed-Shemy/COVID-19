//
//  CovidReport.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct CovidReport: Codable
{
    let confirmed: Int?
    let recovered: Int?
    let deaths: Int?
    let active: Int?
    let critical: Int?
    let date: String?
    
    var viewModel: CovidReportViewModel?
    {
        return CovidReportViewModel(confirmed: confirmed ?? 0, recovered: recovered ?? 0,
                                    deaths: deaths ?? 0, active: active ?? 0,
                                    critical: critical ?? 0, date: date ?? "")
    }
}

struct CovidReportViewModel
{
    let confirmed: Int
    let recovered: Int
    let deaths: Int
    let active: Int
    let critical: Int
    let date: String
}
