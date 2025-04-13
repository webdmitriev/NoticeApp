//error nil

import UIKit

class AddNote: UIViewController {
    
    var folder: Folder?

    private let storage = StorageManager.shared
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "addCellNote")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Note"
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
    }
    
    @objc
    func addNote(){
        storage.createNote(folder: folder, title: UUID().uuidString)
        tableView.reloadData()
    }
    
}

extension AddNote: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        folder?.notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCellNote", for: indexPath)
        
        if let notes = folder?.notes?.allObjects as? [Note]{
            
            let note = notes[indexPath.row]
            var config = cell.defaultContentConfiguration()
            config.text = note.title
            cell.contentConfiguration = config
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

