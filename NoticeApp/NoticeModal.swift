//
//  NoticeModal.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 09.04.2025.
//

import Foundation

struct NoticeModal {
    let id: Int
    let title: String
    let descr: String
    let date: String
    let isActive: Bool
    
    static func MockData() -> [NoticeModal] {
        [
            NoticeModal(id: 1, title: "Почитать книгу",
                        descr: "Составить список необходимых продуктов для ужина. Не забыть проверить, что уже есть в холодильнике.", date: "09/10/24", isActive: true),
            NoticeModal(id: 2, title: "Уборка в квартире",
                        descr: "Провести генеральную уборку в квартире", date: "02/10/24", isActive: false),
            NoticeModal(id: 3, title: "Заголовок 3", descr: "Описание 3", date: "03/10/24", isActive: true),
            NoticeModal(id: 4, title: "Заголовок 4", descr: "Описание 4", date: "05/10/24", isActive: false),
            NoticeModal(id: 5, title: "Заголовок 4", descr: "Описание 4", date: "01/10/24", isActive: false),
            NoticeModal(id: 6, title: "Заголовок 4", descr: "Описание 4", date: "07/10/24", isActive: false),
            NoticeModal(id: 7, title: "Заголовок 4", descr: "Описание 4", date: "03/10/24", isActive: false),
            NoticeModal(id: 8, title: "Заголовок 4", descr: "Описание 4", date: "02/10/24", isActive: false),
            NoticeModal(id: 9, title: "Заголовок 4", descr: "Описание 4", date: "07/10/24", isActive: false),
            NoticeModal(id: 10, title: "Заголовок 4", descr: "Описание 4", date: "8/10/24", isActive: false),
            NoticeModal(id: 11, title: "Заголовок 4", descr: "Описание 4", date: "01/10/24", isActive: false),
        ]
    }
}
