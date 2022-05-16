//
//  DictionaryModel.swift
//  PeronalTransGame
//
//  Created by Ирина Кольчугина on 17.05.2022.
//

import Foundation
import RealmSwift

final class DictionaryModel: Object {
    let firstLang: String
    let firstText: String
    let secondLang: String
    let secondText: String

    init(
        firstLang: String,
        firstText: String,
        secondLang: String,
        secondText: String
    ) {
        self.firstLang = firstLang
        self.firstText = firstText
        self.secondLang = secondLang
        self.secondText = secondText
    }
}
