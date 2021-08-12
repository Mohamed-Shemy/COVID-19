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
}
