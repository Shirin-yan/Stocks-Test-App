//
//  File.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        return Array(self.enumerated())
    }
}
