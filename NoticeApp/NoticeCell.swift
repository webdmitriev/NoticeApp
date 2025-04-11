//
//  NoticeCell.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 10.04.2025.
//

import UIKit

class NoticeCell: UITableViewCell {
    
    static var idCell: String = "NoticeCell"
    private lazy var builder = UIBuilder()
    
    private lazy var cellView: UIView = builder.addView()

    private lazy var cellIcon: UIImageView = builder.addImage(img: "checkmark.circle")
    private lazy var cellTitle: UILabel = builder.addLabel(txt: "Title", fs: 18, lines: 1)
    private lazy var cellDescr: UILabel = builder.addLabel(txt: "Description", lines: 2)
    private lazy var cellDate: UILabel = builder.addLabel(txt: "01/01/2025", fs: 14, color: UIColor(.appWhite.opacity(0.6)), lines: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        constraintsUI()
    }
    
    private func setupUI() {
        addSubview(cellView)
        backgroundColor = .appBlack
        contentView.backgroundColor = .clear

        cellView.addSubviews(cellIcon, cellTitle, cellDescr, cellDate)
        //cellView.backgroundColor = UIColor(.green.opacity(0.3))
        
        cellView.addBottomBorderWithColor(width: 4, color: .gray)
    }
    
    private func constraintsUI() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            cellIcon.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            cellIcon.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            cellIcon.widthAnchor.constraint(equalToConstant: 30),
            cellIcon.heightAnchor.constraint(equalToConstant: 30),

            cellTitle.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellTitle.leadingAnchor.constraint(equalTo: cellIcon.trailingAnchor, constant: 10),
            cellTitle.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            cellDescr.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 1),
            cellDescr.leadingAnchor.constraint(equalTo: cellIcon.trailingAnchor, constant: 10),
            cellDescr.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            cellDate.topAnchor.constraint(equalTo: cellDescr.bottomAnchor, constant: 6),
            cellDate.leadingAnchor.constraint(equalTo: cellIcon.trailingAnchor, constant: 10),
            cellDate.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            cellDate.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(item: NoticeModal) {
        self.cellTitle.text = item.title
        self.cellTitle.setStrikethrough(item.isActive)
        self.cellTitle.textColor = item.isActive ? UIColor(.appWhite.opacity(0.6)) : UIColor(.appWhite)
        
        self.cellDescr.text = item.descr
        self.cellDescr.textColor = item.isActive ? UIColor(.appWhite.opacity(0.6)) : UIColor(.appWhite)
        
        self.cellIcon.image = UIImage(systemName: item.isActive ? "checkmark.circle" : "circle")
        self.cellIcon.tintColor = item.isActive ? UIColor(.yellow.opacity(0.7)) : UIColor(.appWhite.opacity(0.5))
        
        self.cellDate.text = item.date.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
