//
//  APIVC.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 14.04.2025.
//

import UIKit

class APIVC: UIViewController {
    
    let manager = APINetworkManager()
    
    private lazy var apiTable: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "apiCell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.addSubview(self.apiTable)
        
        self.manager.sendRequest(q: "swift")
        
    }
    
}


extension APIVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "apiCell", for: indexPath)

        var config = cell.defaultContentConfiguration()
        config.text = "Text"
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}
