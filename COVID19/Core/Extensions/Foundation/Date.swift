//
//  Date.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension Date
{
    func format(_ format: String) -> String
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
