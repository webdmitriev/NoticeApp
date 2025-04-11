//
//  UIBuilder.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 10.04.2025.
//

import UIKit

class UIBuilder {
    
    let offset: CGFloat = 16
    
    func addView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func addLabel(txt: String, fs: CGFloat = 16, fw: UIFont.Weight = .medium,
                  color: UIColor = UIColor.appWhite, lines: Int = 0) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = txt
        label.font = UIFont.systemFont(ofSize: fs, weight: fw)
        label.textColor = color
        label.numberOfLines = lines
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }
    
    func addImage(img: String) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: img)
        return image
    }
    
}
