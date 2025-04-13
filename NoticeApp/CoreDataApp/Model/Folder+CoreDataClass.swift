//
//  Folder+CoreDataClass.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 12.04.2025.
//
//

import Foundation
import CoreData

@objc(Folder)
public class Folder: NSManagedObject {

}

extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension Folder {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Folder : Identifiable {
//    func deleteFolder() {
//        managedObjectContext?.delete(self)
//        try? managedObjectContext?.save()
//    }
}
