//
//  Title.swift
//  PeronalTransGame
//
//  Created by Ирина Кольчугина on 16.05.2022.
//

import Foundation

enum Title {
    case writeText
    case addToDictionary
    case successAdded
    case resume
    case congratulation
    case error
    case failureAdd
    case ok
    case dictionary
    case emptyDictionary

    var textRus: String {
        switch self {
        case .writeText:
            return "Введите текст"
        case .addToDictionary:
            return "Добавить в словарь"
        case .successAdded:
            return "Слово успешно добавлено"
        case .resume:
            return "Продолжить"
        case .congratulation:
            return "Поздравляем!"
        case .error:
            return "Ошибка!"
        case .failureAdd:
            return "Не удалось добавить слово"
        case .ok:
            return "Понятно"
        case .dictionary:
            return "Словарь"
        case .emptyDictionary:
            return "Словарь пуст"
        }
    }
}
