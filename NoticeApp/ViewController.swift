//
//  ViewController.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 09.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var builder = UIBuilder()
    
    private lazy var noticeItems = NoticeModal.MockData()
    
    // 1 collection
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.register(NoticeCell.self, forCellReuseIdentifier: NoticeCell.idCell)
        $0.backgroundColor = UIColor.appBlack
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSearchBar()

        setupUI()
        setupConstraints()
    }
    
    private func addSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController

        // Настройка placeholder
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(.appWhite.opacity(0.8)),
        ]
        searchController.searchBar.searchTextField.attributedPlaceholder =
            NSAttributedString(string: "Search...", attributes: placeholderAttributes)

        // Дополнительные настройки
        searchController.searchBar.tintColor = .systemBlue
        searchController.searchBar.searchTextField.backgroundColor = UIColor.appGray
        searchController.searchBar.searchTextField.textColor = .appWhite
        searchController.searchBar.searchTextField.leftView?.tintColor = UIColor(.appWhite.opacity(0.8))

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appWhite]
    }

    private func setupUI() {
        view.backgroundColor = UIColor.appBlack
        navigationItem.title = "Notice"

        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noticeItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.idCell, for: indexPath) as! NoticeCell
        
        let item = noticeItems[indexPath.row]
        
        cell.configure(item: item)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notiseData = noticeItems[indexPath.row]
        
        let vc = NoticeEdit()
//        vc.noticeData = notiseData
        navigationController?.pushViewController(vc, animated: true)
    }

}
