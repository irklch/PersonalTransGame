//
//  TranslateViewModel.swift
//  PersonalTransGame
//
//  Created by Ирина Кольчугина on 15.04.2022.
//

import Foundation
import RealmSwift
import Combine

final class TranslateViewModel {

    @Published public var actionsState: TranslateActions = .empty

    public func setSaving(model: DictionaryModel) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(model)
            try? realm.commitWrite()
        }
        catch {
            actionsState = .errorSaving
            return
        }
    }

}

enum TranslateActions {
    case empty
    case errorSaving
}
