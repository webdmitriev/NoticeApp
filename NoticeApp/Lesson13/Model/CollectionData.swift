//
//  CollectionData.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 11.04.2025.
//

import Foundation

enum HeaderType {
    case news, events, users
}

struct CollectionSection {
    let header: String
    let items: [CollectionItems]
    let footer: String
    let type: HeaderType
    
    static func MockData() -> [CollectionSection] {
        
        let newsItems: [CollectionItems] = [
            CollectionItems(headerText: "Заголовок 01", date: Date(),
                            image: "mary-01", descr: "Описание элемента", name: "Mary 01"),
            CollectionItems(headerText: "Заголовок 02", date: Date(),
                            image: "mary-02", descr: "Описание элемента", name: "Mary 02"),
            CollectionItems(headerText: "Заголовок 03", date: Date(),
                            image: "mary-03", descr: "Описание элемента", name: "Mary 03"),
        ]
        
        let newsSection: CollectionSection = CollectionSection(header: "Новости", items: newsItems,
                                                               footer: "Footer", type: .news)
        
        return [newsSection]
    }
}

struct CollectionItems {
    var headerText: String?
    var date: Date?
    let image: String
    let descr: String?
    var name: String? = nil
}
