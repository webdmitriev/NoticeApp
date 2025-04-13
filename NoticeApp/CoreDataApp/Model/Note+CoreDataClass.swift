//
//  Note+CoreDataClass.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 12.04.2025.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

}

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var folder: Folder?

}

extension Note : Identifiable {

}
