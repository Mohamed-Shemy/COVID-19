//
//  CountriesAPI.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya

enum CountriesAPI
{
    case searchByName(String)
}

extension CountriesAPI: TargetType, BaseAPIParametersProtocol
{
    var baseURL: URL
    {
        restcountriesBaseURL
    }
    
    var path: String
    {
        "name"
    }
    
    var method: Method
    {
        .get
    }
    
    var sampleData: Data
    {
        Data()
    }
    
    var headers: [String : String]?
    {
        [:]
    }
    
    var task: Task
    {
        switch self
        {
            case let .searchByName(name):
                let parameters: [String: Any] = ["name": name]
                return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
