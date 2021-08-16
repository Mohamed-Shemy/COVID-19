//
//  String.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension String
{
    var trimmed: String
    {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isNotEmpty: Bool
    {
        return !isEmpty
    }
    
    var isNotEmptyOrSpaces: Bool
    {
        return !isEmptyOrSpaces
    }
    
    var isEmptyOrSpaces: Bool
    {
        return isEmpty || trimmed.isEmpty
    }
}
