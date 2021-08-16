//
//  BaseAPIParametersProtocol.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol BaseAPIParametersProtocol { }

extension BaseAPIParametersProtocol
{
    var covidBaseDomain: String { "https://covid-19-data.p.rapidapi.com/" }
    var covidBaseURL: URL { URL(string: covidBaseDomain)! }
    
    var restcountriesBaseDomain: String { "https://restcountries.eu/rest/v2/" }
    var restcountriesBaseURL: URL { URL(string: restcountriesBaseDomain)! }
    
    var rapidapiHeaders: [String: String]
    {
        [
            "x-rapidapi-key": "a44a07a416msh9c394cb3ec4cbcfp17cda0jsnd7ab4c5ce943",
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "content-type": "application/json",
        ]
    }
}
