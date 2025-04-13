//
//  CoreDataViewController.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 12.04.2025.
//

import UIKit

class CoreDataViewController: UIViewController {
    
    private let storage = StorageManager.shared
    
    var folders: [Folder] = []
        
    private lazy var viewTable: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "dataCoreCell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.storage.getFolder()
        self.folders = storage.folders
        
        self.viewTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBlack
        title = "CoreData"
        view.addSubview(viewTable)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addData))
    }
    
    @objc func addData() {
        print("core data add")
        self.storage.createFolder(name: UUID().uuidString)
        self.folders = storage.folders
        self.viewTable.reloadData()
    }
    
}


extension CoreDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.folders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCoreCell", for: indexPath)
        
        let folder = self.folders[indexPath.row]
        
        var config = cell.defaultContentConfiguration( )
        config.text = folder.name
        config.secondaryText = folder.notes?.count.description
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let folder = self.folders[indexPath.row]

        let vc = AddNote()
        vc.folder = folder
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let folder = self.folders[indexPath.row]
            self.folders.remove(at: indexPath.row)
            self.viewTable.deleteRows(at: [indexPath], with: .automatic)
            
            storage.deleteFolder(folder: folder)
        }
    }
}
