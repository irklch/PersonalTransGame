//
//  Languages.swift
//  PeronalTransGame
//
//  Created by Ирина Кольчугина on 16.05.2022.
//

import Foundation

enum Languages {
    case english
    case russian

    var nameRus: String {
        switch self {
        case .english:
            return "Английский"
        case .russian:
            return "Русский"
        }
    }

}
