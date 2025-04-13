//
//  StorageManager.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 12.04.2025.
//

import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db")
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var folders: [Folder] = []
    
    // 1 create folder
    func createFolder(name: String) {
        let folder = Folder(context: persistentContainer.viewContext)
        folder.date = Date()
        folder.id = UUID().uuidString
        folder.name = name
        
        saveContext()
        getFolder()
    }
    
    // 2 get
    func getFolder() {
        let req = Folder.fetchRequest()
        let result = try? persistentContainer.viewContext.fetch(req)
        
        self.folders = result ?? []
    }
    
    // 3 create note
    func createNote(folder: Folder?, title: String) {
        guard let folder else { return }
        
        let note = Note(context: persistentContainer.viewContext)
        note.id = UUID().uuidString
        note.title = title
        note.date = Date()
        
        note.folder = folder
        
        saveContext()
        getFolder()
    }
    
    // 4 delete note
    func deleteFolder(folder: Folder) {
        persistentContainer.viewContext.delete(folder)
        saveContext()
        getFolder()
    }
    
}
