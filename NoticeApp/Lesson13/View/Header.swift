//
//  NewsHeader.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 11.04.2025.
//

import UIKit

class Header: UICollectionReusableView {
    
    static let reuseId: String = "Header"
    
    private let builder = UIBuilder()
    
    private lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing // раскидываем по краям
        $0.alignment = .center
        $0.spacing = 8
        $0.addArrangedSubview(headerTitle)
        $0.addArrangedSubview(headerBtn)
        return $0
    }(UIStackView())
    
    private lazy var headerTitle: UILabel = builder.addLabel(txt: "", fs: 24, fw: .bold, color: .appBlack, lines: 1)
    
    private lazy var headerBtn: UIButton = {
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader(text: String, type: HeaderType) {
        
        addSubview(hStack)
        
        self.headerTitle.text = text

        switch type {
        case .news:
            self.headerBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        case .events:
            self.headerBtn.setTitle("Добавить мероприятие", for: .normal)
        case .users:
            self.headerBtn.setTitle("Show all", for: .normal)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
