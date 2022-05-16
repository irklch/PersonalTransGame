//
//  StringExtension.swift
//  PeronalTransGame
//
//  Created by Ирина Кольчугина on 17.05.2022.
//

import Foundation

extension Optional where Wrapped == String {
    func nonOptional() -> String {
        return self ?? .empty
    }
}

extension String {
    static let empty = ""
}
