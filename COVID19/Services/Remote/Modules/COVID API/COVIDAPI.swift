//
//  COVIDAPI.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya
import Alamofire

enum CovidAPI
{
    case latestCountryDataByCode(String)
    case dailyReportTotals(_ date: String)
}

extension CovidAPI: TargetType, BaseAPIParametersProtocol
{
    var baseURL: URL
    {
        covidBaseURL
    }
    
    var path: String
    {
        switch self
        {
            case .dailyReportTotals: return "report/totals"
            case .latestCountryDataByCode: return "country/code"
        }
    }
    
    var method: Moya.Method
    {
        .get
    }
    
    var sampleData: Data
    {
        Data()
    }
    
    var headers: [String : String]?
    {
        rapidapiHeaders
    }
    
    var task: Task
    {
        switch self
        {
            case let .dailyReportTotals(date):
                let parameters: [String: Any] = ["date": date]
                return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
                
            case let .latestCountryDataByCode(code):
                let parameters: [String: Any] = ["code": code]
                return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
