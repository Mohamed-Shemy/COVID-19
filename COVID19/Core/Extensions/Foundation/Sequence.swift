//
//  Sequence.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension Sequence
{
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, _ condition: (T, T) -> Bool) -> [Element]
    {
        sorted { condition($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    func first<T: Comparable>(where keyPath: KeyPath<Element, T>, _ condition: (T, T) -> Bool, _ element: T) -> Element?
    {
        first(where: { condition($0[keyPath: keyPath], element) })
    }
}
