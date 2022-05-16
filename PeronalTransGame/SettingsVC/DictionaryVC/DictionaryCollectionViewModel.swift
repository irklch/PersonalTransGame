//
//  DictionaryCollectionViewModel.swift
//  PeronalTransGame
//
//  Created by Ирина Кольчугина on 17.05.2022.
//

import Foundation
import Combine
import RealmSwift

final class DictionaryCollectionViewModel {

    public var words = [DictionaryModel]()
    @Published public var actionsState: DictionaryCollectionActions = .empty

    init() {
//        setLoadingWords()
    }

    public func setLoadingWords() {
        do {
            let realm = try Realm()
            realm.beginWrite()
            let items = realm.objects(DictionaryModel.self)
            words = Array(items)
            actionsState = .successLoading
            try? realm.commitWrite()
        }
        catch {
            actionsState = .failureLoading
            return
        }
    }

}

enum DictionaryCollectionActions {
    case empty
    case successLoading
    case failureLoading
}
